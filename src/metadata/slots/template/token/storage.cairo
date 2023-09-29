use starknet::ContractAddress;
use metadata::metadata::common::models::StorageData;
use metadata::interfaces::absorber::{IAbsorberDispatcher, IAbsorberDispatcherTrait};
use metadata::interfaces::component_provider::{
    IProviderExtDispatcher, IProviderExtDispatcherTrait, IComponentProviderDispatcher
};

use cairo_erc_3525::interface::{IERC3525Dispatcher, IERC3525DispatcherTrait};

#[inline(always)]
fn fetch_data(contract_address: ContractAddress, token_id: u256) -> StorageData {
    let erc3525 = IERC3525Dispatcher { contract_address };
    let slot = erc3525.slot_of(token_id);
    let mut asset_value = erc3525.value_of(token_id);

    let absorber = IAbsorberDispatcher { contract_address };
    let project_value = absorber.get_project_value(slot);
    let current_absorption = absorber.get_current_absorption(slot);
    let final_absorption = absorber.get_final_absorption(slot);
    let ton_equivalent = absorber.get_ton_equivalent(slot);
    let start_time = absorber.get_start_time(slot);
    let final_time = absorber.get_final_time(slot);

    let timestamp = starknet::get_block_timestamp();

    let project = IProviderExtDispatcher { contract_address };
    let component_provider = IComponentProviderDispatcher {
        contract_address: project.get_component_provider()
    };

    StorageData {
        component_provider,
        asset_value,
        project_value,
        slot,
        current_absorption,
        final_absorption,
        ton_equivalent,
        start_time,
        final_time,
        timestamp
    }
}
