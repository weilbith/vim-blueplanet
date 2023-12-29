--- @param text string
--- @return string
local function encode_json_escape_sequences_as_terminal_codes(text)
  local encoded, _ = text:gsub('\n', '\13'):gsub('\t', '\9'):gsub('\\"', '"')
  return encoded
end

--- @param text string
--- @return string
local function encode_terminal_codes_as_json_escape_sequences(text)
  local encoded, _ = text:gsub('\13', '\n'):gsub('\9', '\t'):gsub('"', '\\"')
  return encoded
end

return {
  encode_json_escape_sequences_as_terminal_codes = encode_json_escape_sequences_as_terminal_codes,
  encode_terminal_codes_as_json_escape_sequences = encode_terminal_codes_as_json_escape_sequences,
}
