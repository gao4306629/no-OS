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

SRCS += $(PROJECT)/src/app/adf4377_sdz.c
SRCS += $(DRIVERS)/api/spi.c \
	$(DRIVERS)/api/gpio.c \
	$(DRIVERS)/frequency/adf4377/adf4377.c
SRCS +=	$(PLATFORM_DRIVERS)/axi_io.c \
	$(PLATFORM_DRIVERS)/xilinx_spi.c \
	$(PLATFORM_DRIVERS)/xilinx_gpio.c \
	$(PLATFORM_DRIVERS)/delay.c \
	$(NO-OS)/util/util.c
ifeq (y,$(strip $(TINYIIOD)))
LIBRARIES += iio
SRCS += $(NO-OS)/util/fifo.c \
	$(NO-OS)/util/list.c \
	$(PLATFORM_DRIVERS)/uart.c \
	$(PLATFORM_DRIVERS)/irq.c \
	$(NO-OS)/iio/iio_app/iio_app.c \
	$(DRIVERS)/frequency/adf4377/iio_adf4377.c
endif
INCS +=	$(PROJECT)/src/app/app_config.h \
	$(PROJECT)/src/app/parameters.h
ifeq (y,$(strip $(TINYIIOD)))
INCS +=	$(DRIVERS)/frequency/adf4377/iio_adf4377.h
endif
INCS += $(DRIVERS)/frequency/adf4377/adf4377.h
INCS +=	$(PLATFORM_DRIVERS)/spi_extra.h \
	$(PLATFORM_DRIVERS)/gpio_extra.h
INCS +=	$(INCLUDE)/axi_io.h \
	$(INCLUDE)/spi.h \
	$(INCLUDE)/gpio.h \
	$(INCLUDE)/error.h \
	$(INCLUDE)/delay.h \
	$(INCLUDE)/util.h \
	$(INCLUDE)/print_log.h
ifeq (y,$(strip $(TINYIIOD)))
INCS += $(INCLUDE)/fifo.h \
	$(INCLUDE)/irq.h \
	$(INCLUDE)/uart.h \
	$(INCLUDE)/list.h \
	$(PLATFORM_DRIVERS)/irq_extra.h \
	$(PLATFORM_DRIVERS)/uart_extra.h \
	$(NO-OS)/iio/iio_app/iio_app.h
endif
