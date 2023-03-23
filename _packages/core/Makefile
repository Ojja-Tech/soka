runner:
	fvm flutter pub run build_runner build --delete-conflicting-outputs

pub_get:
	fvm flutter pub get
	
pub_add:
	fvm flutter pub add ${pkg}

model:
	mason make model -c ${m} -o ${o}
	
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: runner pub_get pub_add model
.DEFAULT_GOAL := help
