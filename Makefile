GFM_SPEC_VERSION=0.29.0.gfm.0

Tests/CommonMarkSpecTests: Resources/spec.json | Resources/spec
	@mkdir -p $@
	@for section in $(shell jq -c '.[].section' $< | uniq); do \
		filename=`echo "$${section}" | awk -f Resources/camelcase.awk`; \
		jq "map(select(.section == \"$${section}\"))" $< > "$|/$${filename}.json" ; \
		gyb --line-directive '' -o $@/$${filename}Tests.swift -D filename="$${filename}" Resources/CommonMarkSpecTests.swift.gyb; \
	done

Resources/spec:
	@mkdir -p Resources/spec

Resources/spec.json: Resources/test/spec.txt Resources/test/spec_tests.py Resources/test/normalize.py Resources/test/cmark.py
	@python3 Resources/test/spec_tests.py --spec Resources/test/spec.txt --dump-tests > $@

Resources/test:
	@mkdir -p Resources/test

Resources/test/%: Resources/test
	@curl -s -L "https://github.com/github/cmark-gfm/raw/${GFM_SPEC_VERSION}/test/$*" > $@

%.swift: %.swift.gyb
	@gyb --line-directive '' -o $@ $<

.PHONY:
clean:
	@rm -f Resources/spec.json
	@rm -rf Resources/spec
	@rm -rf Resources/test
	@rm -rf Tests/CommonMarkSpecTests
