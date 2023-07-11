use starknet::get_contract_address;
use starknet::ContractAddress;

use metadata::interfaces::erc3525::{IERC3525Dispatcher, IERC3525DispatcherTrait};
use metadata::interfaces::project::{IProjectDispatcher, IProjectDispatcherTrait};

use metadata::metadata::common::models::AssetStorageData;

mod ProjectData {
    const NAME: felt252 = 'Banegas Farm';
    const DEVELOPER: felt252 = 'Corcovado Foundation';
    const CERTIFIER: felt252 = 'Wildsense';
    const AREA: felt252 = 25;
    const COUNTRY: felt252 = 'Costa Rica';
    const END_YEAR: felt252 = 2052; // mutable storage?
    const END_MONTH: felt252 = 12; // mutable storage?
    const DURATION_IN_YEARS: felt252 = 30; // 2052 - 2022;
    const PROJECTED_CU: felt252 = 1573;
    const COLOR: felt252 = 'Green';
    const TYPE: felt252 = 'Forest';
    const CATEGORY: felt252 = 'Regeneration';
    const STATUS: felt252 = 'Active'; // mutable storage?
    const SOURCE: felt252 = 'Carbonable';
}

mod AssetData {}

#[inline(always)]
fn fetch_slot_data(contract_address: ContractAddress, slot: u256) -> felt252 {
    1
}


#[inline(always)]
fn fetch_token_data(contract_address: ContractAddress, token_id: u256) -> AssetStorageData {
    let instance = IERC3525Dispatcher { contract_address };
    let project_instance = IProjectDispatcher { contract_address };
    let slot = instance.slotOf(token_id);
    AssetStorageData {
        total_value: instance.totalValue(slot),
        project_value: project_instance.getProjectValue(slot),
        slot,
        asset_value: instance.valueOf(token_id),
    }
}
