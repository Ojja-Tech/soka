CORE_PKG := _packages/core
BUILDER_DIRS := $(CORE_PKG) packages/network features/auth admin client
SUB_DIRS := $(BUILDER_DIRS) packages/widgets packages/routing packages/tusome_assets

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

models:
	$(MAKE) -C $(CORE_PKG) models

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: runner pub_get $(SUB_DIRS) models help
.DEFAULT_GOAL := help
