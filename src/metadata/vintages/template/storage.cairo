use starknet::ContractAddress;
use metadata::metadata::vintages::models::CPV3StorageData;
use metadata::interfaces::vintage::{IVintageDispatcher, IVintageDispatcherTrait};
use metadata::interfaces::component_provider::{
    IProviderExtDispatcher, IProviderExtDispatcherTrait, IComponentProviderDispatcher
};

use cairo_erc_3525::interface::{IERC3525Dispatcher, IERC3525DispatcherTrait};

#[inline(always)]
fn fetch_data(contract_address: ContractAddress, token_id: u256) -> CPV3StorageData {
    let vintages = IVintageDispatcher { contract_address };
    let project_carbon = vintages.get_project_carbon();
    let all_vintages = vintages.get_cc_vintages();
    let vintage = *all_vintages.at(token_id.try_into().unwrap());
    let start_year: u32 = *all_vintages.at(0).year;
    let end_year: u32 = *all_vintages.at(all_vintages.len() - 1).year;

    let timestamp = starknet::get_block_timestamp();

    let project = IProviderExtDispatcher { contract_address };
    let component_provider = IComponentProviderDispatcher {
        contract_address: project.get_component_provider()
    };

    CPV3StorageData {
        component_provider, project_carbon, token_id, vintage, timestamp, start_year, end_year,
    }
}
