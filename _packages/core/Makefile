runner:
	fvm flutter pub run build_runner build --delete-conflicting-outputs

pub_get:
	fvm flutter pub get
	
pub_add:
	fvm flutter pub add ${pkg}

model:
	mason make model -c ${m} -o ${o}

models:
	# Make models
	mason make model -c models/image.json -o lib/models --on-conflict overwrite
	mason make model -c models/team/team.json -o lib/models/team  --on-conflict overwrite
	mason make model -c models/player/birth.json -o lib/models/player  --on-conflict overwrite
	mason make model -c models/player/player.json -o lib/models/player  --on-conflict overwrite
	mason make model -c models/league/league.json -o lib/models/league  --on-conflict overwrite
	mason make model -c models/league/season.json -o lib/models/league  --on-conflict overwrite

	# Override relations
	find lib/models \( -name '*.dart' \) -exec sed -i '' -E 's|package\:core\/[a-zA-Z\/]+\/app_image\.dart|package:core/models/app_image.dart|g' {} +

	# Format
	find lib/models -type d -exec dart format {} +
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: runner pub_get pub_add model models
.DEFAULT_GOAL := help
