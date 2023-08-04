use array::ArrayTrait;

const ONE_HA_IN_M2: felt252 = 10000;

// TODO: real values here
const IERC165_ID: u32 = 0x01ffc9a7;
const IERC3525_ID: u32 = 0x0d912442;
const IERC3525_METADATA_ID: u32 = 0x0e89341c;
const IERC721_ID: u32 = 0x80ac58cd;
const IERC721_METADATA_ID: u32 = 0x5b5e139f;


const EXTERNAL_URL: felt252 = 'https://app.carbonable.io/';

#[inline(always)]
fn get_external_url() -> Span<felt252> {
    let mut a = ArrayTrait::new();
    a.append(EXTERNAL_URL);
    a.span()
}

#[inline(always)]
fn get_youtube_url() -> Span<felt252> {
    let mut a = ArrayTrait::new();
    a.append('https://youtu.be/5dZrROBmfKU');
    a.span()
}

#[inline(always)]
fn get_banner_img_url() -> Span<felt252> {
    let mut a = ArrayTrait::new();
    a.append('ipfs://Qmdjj76nkc1HQn8Tr3ertWs');
    a.append('9eWkFMBxXQkGwjHEp6mWbig/banner.');
    a.append('png');
    a.span()
}
