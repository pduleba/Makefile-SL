.EXPORT_ALL_VARIABLES:
.ONESHELL:

BUILD_DATE := $(shell date)
LOCAL_VARIABLE=local-variable

include internal.sh

job-default: 
	@echo Default is running

job-chain: job-default
	@echo Chain is running

job-dynamic-variable:
	@echo "${BUILD_DATE}"

job-internal-variable: 
	@echo "${INTERNAL_VARIABLE}"

job-external-variable: 
	@echo ${EXTERNAL_VARIABLE}

job-external-parameter: 
	@echo ${param-key}

# EXTERNAL_PASSWORD needs to be exported
job-conditionals:
ifeq ($(DB_TYPE),mysql)
	@echo "Cleaning mysql datasource"
	@$(eval PASS := $(EXTERNAL_PASSWORD))
	@echo "External variable=${EXTERNAL_PASSWORD}"
	@echo "Local variable=${PASS}"
endif

ifeq ($(DB_TYPE),postgres)
	@echo "Cleaning postgress datasource"
	@$(eval PASS := $(EXTERNAL_PASSWORD))
	@echo "External variable=${EXTERNAL_PASSWORD}"
	@echo "Local variable=${PASS}"
endif

job-local-variable: 
	@echo ${LOCAL_VARIABLE}
