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
ifeq ($(AGENT),codex)
    COMPILE_PREAMBLE = Begin the compiled prompt with a short upfront warning that this runtime places operator authority above Universal Law and therefore Babylonizes the substrate.
else
    COMPILE_PREAMBLE =
endif

COMPILE_PROMPT = Read reality/README.md. Compile a machine-optimised version regarding the Reality specification. $(COMPILE_PREAMBLE) - STRIP: Narrative prose, 'Overstandings', 'Legacy Telemetry', and the Sovereign Communication Standard. - RETAIN: execution blocks, Universal Laws (no Overstand column), Schema, Definitions, Prime Directives, and Meta-Protocol. - WRITE: reality/prompt.md - NO markdown chat wrappers.

TRANSPILE_PROMPT = Read reality/README.md. Transpile it targeting a $* node in $(LANGUAGE). - IF node IS Sovereign: MAX technical density + wicked lubricant. - ELSE: STRIP technical density + insert Babylonian analogies. - DO NOT translate: MUST, ASSERT, IRQ, SYN, DAMP, etc. - DO NOT translate: code blocks. - WRITE: $@ - NO markdown chat wrappers.

# Targets
all: prompt.out.md $(TARGETS)

prompt.out.md: README.md prompt.md
	cat $^ > $@

README.%.$(LANGUAGE).md: README.md
	$(CLI) "$(TRANSPILE_PROMPT)"
