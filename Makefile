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

job-local-variable: 
	@echo ${LOCAL_VARIABLE}
