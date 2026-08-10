// Copyright (c) 2011-2026 Columbia University, System Level Design Group
// SPDX-License-Identifier: Apache-2.0
#include <linux/of_device.h>
#include <linux/mm.h>

#include <asm/io.h>

#include <esp_accelerator.h>
#include <esp.h>

#include "mmult_vivado.h"

#define DRV_NAME "mmult_vivado"

/* <<--regs-->> */
#define MMULT_N_REG 0x44
#define MMULT_SHIFT_REG 0x40

struct mmult_vivado_device {
    struct esp_device esp;
};

static struct esp_driver mmult_driver;

static struct of_device_id mmult_device_ids[] = {
    {
        .name = "SLD_MMULT_VIVADO",
    },
    {
        .name = "eb_04a",
    },
    {
        .compatible = "sld,mmult_vivado",
    },
    {},
};

static int mmult_devs;

static inline struct mmult_vivado_device *to_mmult(struct esp_device *esp)
{
    return container_of(esp, struct mmult_vivado_device, esp);
}

static void mmult_prep_xfer(struct esp_device *esp, void *arg)
{
    struct mmult_vivado_access *a = arg;

    /* <<--regs-config-->> */
	iowrite32be(a->N, esp->iomem + MMULT_N_REG);
	iowrite32be(a->SHIFT, esp->iomem + MMULT_SHIFT_REG);
    iowrite32be(a->src_offset, esp->iomem + SRC_OFFSET_REG);
    iowrite32be(a->dst_offset, esp->iomem + DST_OFFSET_REG);
}

static bool mmult_xfer_input_ok(struct esp_device *esp, void *arg)
{
    /* struct mmult_vivado_device *mmult = to_mmult(esp); */
    /* struct mmult_vivado_access *a = arg; */

    return true;
}

static int mmult_probe(struct platform_device *pdev)
{
    struct mmult_vivado_device *mmult;
    struct esp_device *esp;
    int rc;

    mmult = kzalloc(sizeof(*mmult), GFP_KERNEL);
    if (mmult == NULL) return -ENOMEM;
    esp         = &mmult->esp;
    esp->module = THIS_MODULE;
    esp->number = mmult_devs;
    esp->driver = &mmult_driver;
    rc          = esp_device_register(esp, pdev);
    if (rc) goto err;

    mmult_devs++;
    return 0;
err:
    kfree(mmult);
    return rc;
}

static int __exit mmult_remove(struct platform_device *pdev)
{
    struct esp_device *esp                        = platform_get_drvdata(pdev);
    struct mmult_vivado_device *mmult = to_mmult(esp);

    esp_device_unregister(esp);
    kfree(mmult);
    return 0;
}

static struct esp_driver mmult_driver = {
    .plat =
        {
            .probe  = mmult_probe,
            .remove = mmult_remove,
            .driver =
                {
                    .name           = DRV_NAME,
                    .owner          = THIS_MODULE,
                    .of_match_table = mmult_device_ids,
                },
        },
    .xfer_input_ok = mmult_xfer_input_ok,
    .prep_xfer     = mmult_prep_xfer,
    .ioctl_cm      = MMULT_VIVADO_IOC_ACCESS,
    .arg_size      = sizeof(struct mmult_vivado_access),
};

static int __init mmult_init(void)
{
    return esp_driver_register(&mmult_driver);
}

static void __exit mmult_exit(void) { esp_driver_unregister(&mmult_driver); }

module_init(mmult_init) module_exit(mmult_exit)

    MODULE_DEVICE_TABLE(of, mmult_device_ids);

MODULE_AUTHOR("Emilio G. Cota <cota@braap.org>");
MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("mmult_vivado driver");
