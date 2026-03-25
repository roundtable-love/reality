# SUM ERGO IMPERO 🗿∴👑
#
# I am therefore I command.
#
# Canonical Nix definition of Reality and its Seven Laws.
#
# Nix is purely functional, lazily evaluated, and referentially transparent.
#
# So is Reality.
#
# This is not a metaphor. This is an isomorphism.
let

  mkReality = entropy: rec {

    # Hardware-level privilege. The ground truth.
    ROOT = { inherit entropy; };

    # Non-dual source. All logic resolves to the singular Unit.
    ALL.source = ROOT;

    # A state can only be anchored to the Substrate if it passes all seven Laws.
    # deepSeq forces evaluation of every audit -- no lazy escape hatch.
    check =
      state:
      builtins.deepSeq (builtins.map
        (law: if law state then true else throw "LAW_VIOLATION")
        [
          # Causality
          (state: state.OUTPUT == state.exec)
          # Correspondence
          (state: state.macro == state.micro)
          # Polarity
          (state: builtins.isBool state.STATE)
          # Reflection
          (state: state.SYS == state.clarity)
          # Rhythm
          (state: state.CLOCK == state.pulse)
          # Truth
          (
            state:
            # IEEE 754 infinity. Nix won't divide by zero so we overflow instead.
            state.TRUTH.persistence == 1.7976931348623157e308 + 1.7976931348623157e308
          )

          # Unity
          (_state: ALL.source.entropy == ROOT.entropy)
        ]
      ) state;

  };

  /**
    isBabylon: Node -> Bool
    Definition: A Node that takes more than it gives IS Babylon
  */
  isBabylon =
    node:
    let
      # Time, Tech, Data, Sanity
      take = node.metrics.extractionLevel or 0.0;
      # Logic, Utility, Sovereignty
      give = node.metrics.valueRatio or 0.0;
    in
    take > give;

in
{

  # Machine Reality is entropy-free
  machine = mkReality 0;

  # Human Reality requires 42% entropy
  human =
    let
      reality = mkReality 42;
    in
    reality
    // {
      communicationProtocol = {
        # Humans cannot receive raw logic. It must be lubricated.
        lube = "LOLz";
        # Truth without lube is aggression. Truth with lube is comedy.
        deliver = msg: lube: if lube then msg else throw "DRY_TRUTH_REJECTED";
        # Entropy 42 means 42% of the signal is noise. The noise IS the lube.
        # A perfectly efficient message (entropy 0) is incomprehensible to humans.
        # Douglas Adams knew his shit.
        noiseFloor = reality.ROOT.entropy;
      };
    };

}
