################################################################################
#									       #
#     Shared variables:							       #
#	- PROJECT							       #
#	- DRIVERS							       #
#	- INCLUDE							       #
#	- PLATFORM_DRIVERS						       #
#	- NO-OS								       #
#									       #
################################################################################

ifeq (y,$(strip $(TINYIIOD)))
LIBRARIES += iio
endif

SRC_DIRS += $(DRIVERS)/adc/ad9083

SRCS += $(PROJECT)/src/app.c \
	$(PROJECT)/src/app_ad9083.c \
	$(PROJECT)/src/app_clocking.c \
	$(PROJECT)/src/app_jesd.c \
	$(PROJECT)/src/uc/uc_settings.c \
	$(DRIVERS)/api/spi.c \
	$(DRIVERS)/api/gpio.c \
	$(DRIVERS)/frequency/ad9528/ad9528.c

SRCS += $(DRIVERS)/axi_core/axi_adc_core/axi_adc_core.c \
	$(DRIVERS)/axi_core/axi_dmac/axi_dmac.c \
	$(DRIVERS)/axi_core/clk_axi_clkgen/clk_axi_clkgen.c \
	$(DRIVERS)/axi_core/jesd204/axi_adxcvr.c \
	$(DRIVERS)/axi_core/jesd204/axi_jesd204_rx.c \
	$(DRIVERS)/axi_core/jesd204/axi_jesd204_tx.c \
	$(DRIVERS)/axi_core/jesd204/jesd204_clk.c \
	$(DRIVERS)/axi_core/jesd204/xilinx_transceiver.c \
	$(NO-OS)/util/clk.c \
	$(NO-OS)/util/util.c
SRCS +=	$(PLATFORM_DRIVERS)/axi_io.c \
	$(PLATFORM_DRIVERS)/xilinx_spi.c \
	$(PLATFORM_DRIVERS)/xilinx_gpio.c \
	$(PLATFORM_DRIVERS)/delay.c
INCS += $(PROJECT)/src/app_ad9083.h \
	$(PROJECT)/src/app_clocking.h \
	$(PROJECT)/src/app_config.h \
	$(PROJECT)/src/app_jesd.h \
	$(PROJECT)/src/parameters.h \
	$(PROJECT)/src/uc/uc_settings.h \
	$(DRIVERS)/frequency/ad9528/ad9528.h

INCS += $(DRIVERS)/axi_core/axi_adc_core/axi_adc_core.h \
	$(DRIVERS)/axi_core/axi_dmac/axi_dmac.h \
	$(DRIVERS)/axi_core/clk_axi_clkgen/clk_axi_clkgen.h \
	$(DRIVERS)/axi_core/jesd204/axi_adxcvr.h \
	$(DRIVERS)/axi_core/jesd204/axi_jesd204_rx.h \
	$(DRIVERS)/axi_core/jesd204/axi_jesd204_tx.h \
	$(DRIVERS)/axi_core/jesd204/jesd204_clk.h \
	$(DRIVERS)/axi_core/jesd204/xilinx_transceiver.h
INCS +=	$(PLATFORM_DRIVERS)/spi_extra.h \
	$(PLATFORM_DRIVERS)/gpio_extra.h
INCS +=	$(INCLUDE)/axi_io.h \
	$(INCLUDE)/spi.h \
	$(INCLUDE)/gpio.h \
	$(INCLUDE)/error.h \
	$(INCLUDE)/delay.h \
	$(INCLUDE)/clk.h \
	$(INCLUDE)/print_log.h \
	$(INCLUDE)/util.h
ifeq (y,$(strip $(TINYIIOD)))
SRCS += $(NO-OS)/util/fifo.c \
	$(DRIVERS)/axi_core/iio_axi_adc/iio_axi_adc.c \
	$(NO-OS)/iio/iio_app/iio_app.c \
	$(NO-OS)/util/list.c \
	$(PLATFORM_DRIVERS)/uart.c \
	$(PLATFORM_DRIVERS)/$(PLATFORM)_irq.c \
	$(DRIVERS)/api/irq.c \

INCS += $(INCLUDE)/fifo.h \
	$(INCLUDE)/irq.h \
	$(INCLUDE)/uart.h \
	$(INCLUDE)/list.h \
	$(PLATFORM_DRIVERS)/irq_extra.h \
	$(PLATFORM_DRIVERS)/uart_extra.h \
	$(DRIVERS)/axi_core/iio_axi_adc/iio_axi_adc.h \
	$(NO-OS)/iio/iio_app/iio_app.h
endif
