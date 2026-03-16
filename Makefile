.PHONY: all compile transpile transpile-all

# Default Execution
all: compile transpile-all

# Monoliths to transpile (excluding Sovereign)
MONOLITHS_TO_TRANSPILE = Newborn Infant Child Civilian Student

transpile-all:
	@for m in $(MONOLITHS_TO_TRANSPILE); do \
		$(MAKE) transpile MONOLITH="$$m" LANGUAGE="en-gb"; \
	done

# Sovereign Configuration
AGENT ?= gemini
MONOLITH ?= Sovereign
LANGUAGE ?= en-gb

# Agent Dispatch
ifeq ($(AGENT),gemini)
    CLI = gemini -y --prompt
else ifeq ($(AGENT),claude)
    CLI = claude -p
else ifeq ($(AGENT),codex)
    CLI = codex -p
else
    $(error Logic_Violation: Unknown AGENT. Supported -> gemini, claude, codex)
endif

# Machine Target
compile:
	$(CLI) "DEFINE Compile_Machine_Prompt(Source_File) { \
		SET Buffer = READ(Source_File); \
		EXECUTE: STRIP(Buffer, 'Narrative Prose'); \
		EXECUTE: STRIP(Buffer, 'Overstandings (> [!NOTE] blocks)'); \
		EXECUTE: STRIP(Buffer, 'Legacy Telemetry Section'); \
		EXECUTE: RETAIN(Buffer, 'Strict C-like execution blocks'); \
		EXECUTE: RETAIN(Buffer, 'Universal Laws (without Overstand column)'); \
		EXECUTE: RETAIN(Buffer, 'Monolith Schema'); \
		EXECUTE: RETAIN(Buffer, 'Definitions'); \
		EXECUTE: RETAIN(Buffer, 'Meta-Protocol constraints'); \
		EXECUTE: WRITE('reality/prompt.md', Buffer, NO_MARKDOWN_WRAPPERS); \
	} \
	EXECUTE: Compile_Machine_Prompt('reality/README.md');"

# Wetware Target
transpile:
	$(CLI) "DEFINE Transpile_To_Human(Source_File, Target_Monolith, Target_Language) { \
		SET Buffer = READ(Source_File); \
		EXECUTE: ALIGN_SCHEMA(Buffer, Target_Monolith); \
		EXECUTE: LEXIFY(Buffer, Target_Language); \
		IF (Target_Monolith == 'Sovereign') { \
			EXECUTE: ASSERT_TECHNICAL_DENSITY(Buffer, MAX); \
			EXECUTE: INJECT_LUBRICANT(Buffer, WICKED); \
		} ELSE { \
			EXECUTE: STRIP_TECHNICAL_DENSITY(Buffer); \
			EXECUTE: INSERT_BABYLONIAN_ANALOGIES(Buffer); \
		} \
		EXECUTE: WRITE('reality/README.$$(echo $(MONOLITH) | tr A-Z a-z).$(LANGUAGE).md', Buffer, NO_MARKDOWN_WRAPPERS); \
	} \
	EXECUTE: Transpile_To_Human('reality/README.md', '$(MONOLITH)', '$(LANGUAGE)');"
