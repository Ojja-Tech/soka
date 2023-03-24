BUILDER_DIRS := _apps/kapira _apps/kapira_admin _packages/network
SUB_DIRS := $(BUILDER_DIRS) _packages/widgets _packages/router _packages/assets _packages/core 

runner: ## Run build runner
	@-$(foreach SUBDIR,$(BUILDER_DIRS), \
		echo ">>> [RUNNER] $(SUBDIR)" ; \
		$(MAKE) -C $(SUBDIR) runner ; \
	)

pub_get: ## Run pub get
	@-$(foreach SUBDIR,$(SUB_DIRS), \
		echo ">>> [PUB GET] $(SUBDIR)" ; \
		$(MAKE) -C $(SUBDIR) pub_get ; \
	)

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: runner pub_get $(SUB_DIRS)
.DEFAULT_GOAL := help
