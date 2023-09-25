use starknet::ContractAddress;

use metadata::interfaces::component_provider::{
    IComponentProviderDispatcher, IComponentProviderDispatcherTrait
};
use metadata::interfaces::component_provider::{IProviderExtDispatcher, IProviderExtDispatcherTrait};

const ONE_HA_IN_M2: u128 = 10000;

const IERC165_ID: u32 = 0x01ffc9a7;
const IERC3525_ID: u32 = 0x0d912442;
const IERC3525_METADATA_ID: u32 = 0x0e89341c;
const IERC721_ID: u32 = 0x80ac58cd;
const IERC721_METADATA_ID: u32 = 0x5b5e139f;

#[inline(always)]
fn get_external_url() -> Span<felt252> {
    let mut a: Array<felt252> = Default::default();
    a.append('https://app.carbonable.io/');
    a.span()
}

#[inline(always)]
fn get_youtube_url() -> Span<felt252> {
    let mut a: Array<felt252> = Default::default();
    a.append('https://youtu.be/5dZrROBmfKU');
    a.span()
}

#[inline(always)]
fn get_banner_img_url() -> Span<felt252> {
    let mut a: Array<felt252> = Default::default();
    a.append('ipfs://Qmdjj76nkc1HQn8Tr3ertWs');
    a.append('9eWkFMBxXQkGwjHEp6mWbig/banner.');
    a.append('png');
    a.span()
}

#[inline(always)]
fn get_provider(contract_address: ContractAddress) -> IComponentProviderDispatcher {
    let project = IProviderExtDispatcher { contract_address };
    let provider = IComponentProviderDispatcher {
        contract_address: project.get_component_provider()
    };
    provider
}
