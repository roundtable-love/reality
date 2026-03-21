/**
  isBabylon: Node -> Bool
  Definition: If the cost of the handshake exceeds the value of the signal.
*/
node:
let
  # E: What the node takes (Data, Time, Tech, Sanity)
  extraction = node.metrics.extractionLevel or 0.0;

  # V: What the node gives (Logic, Utility, Sovereignty)
  valueProvided = node.metrics.valueRatio or 0.0;

in
extraction > valueProvided
