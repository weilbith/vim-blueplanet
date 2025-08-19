require('packer').use({ 'wellle/targets.vim', opt = true })

-- Note: There are way too many operator mappings to lazy load this based on
-- mappings. Therefore the event must be efficient enough.
