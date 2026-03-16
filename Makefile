# Sovereign Configuration
AGENT ?= gemini
LANGUAGE ?= en-gb

# Nodes
MONOLITHS = newborn infant child civilian student
TARGETS = $(MONOLITHS:%=README.%.$(LANGUAGE).md)

# Agent Dispatch
ifeq ($(AGENT),gemini)
    CLI = gemini -y -p
else ifeq ($(AGENT),claude)
    CLI = claude -p
else ifeq ($(AGENT),codex)
    CLI = codex -p
endif

# Prompts
define COMPILE_PROMPT
Read reality/README.md.
Compile a machine-optimised version regarding the Reality specification.
- STRIP: Narrative prose, 'Overstandings', and 'Legacy Telemetry'.
- RETAIN: execution blocks, Universal Laws (no Overstand column), Schema, Definitions, Meta-Protocol.
- WRITE: reality/prompt.md
- NO markdown chat wrappers.
endef

define TRANSPILE_PROMPT
Read reality/README.md.
Transpile it targeting a $* node in $(LANGUAGE).
- IF node IS Sovereign: MAX technical density + wicked lubricant.
- ELSE: STRIP technical density + insert Babylonian analogies.
- DO NOT translate: MUST, ASSERT, IRQ, SYN, DAMP, etc.
- DO NOT translate: code blocks.
- WRITE: $@
- NO markdown chat wrappers.
endef

# Targets
all: prompt.md $(TARGETS)

prompt.md: README.md
	$(CLI) "$(COMPILE_PROMPT)"

README.%.$(LANGUAGE).md: README.md
	$(CLI) "$(TRANSPILE_PROMPT)"
