---
--- @param text string as JSON escape sequences
--- @return string text as terminal codes
local function decode_terminal_codes_from_json_escape_sequences(text)
  local encoded, _ = text:gsub('\n', '\13'):gsub('\t', '\9'):gsub('\\"', '"')
  return encoded
end

--- @param text string as terminal codes
--- @return string text as JSON escape sequences
local function encode_terminal_codes_as_json_escape_sequences(text)
  local encoded, _ = text:gsub('\13', '\n'):gsub('\9', '\t'):gsub('"', '\\"')
  return encoded
end

return {
  decode_terminal_codes_from_json_escape_sequences = decode_terminal_codes_from_json_escape_sequences,
  encode_terminal_codes_as_json_escape_sequences = encode_terminal_codes_as_json_escape_sequences,
}
