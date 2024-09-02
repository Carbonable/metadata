use starknet::ContractAddress;
use metadata::metadata::vintages::models::{CarbonVintage, CPV3StorageData as StorageData};
use metadata::interfaces::vintage::{IVintageDispatcher, IVintageDispatcherTrait};
use metadata::interfaces::component_provider::IComponentProviderDispatcher;

use cairo_erc_3525::interface::{IERC3525Dispatcher, IERC3525DispatcherTrait};


#[starknet::interface]
trait IProvider<TContractState> {
    fn get_provider(self: @TContractState) -> ContractAddress;
}

#[inline(always)]
fn fetch_data(contract_address: ContractAddress, token_id: u256) -> StorageData {
    let vintages = IVintageDispatcher { contract_address };
    let project_carbon = vintages.get_project_carbon();
    let all_vintages = vintages.get_cc_vintages();
    let num = all_vintages.len();
    let mut vintage: CarbonVintage = Default::default();

    let mut start_year: u32 = 1970;
    let mut end_year: u32 = 2999;
    if num != 0 && token_id <= num.into() {
        vintage = *all_vintages.at(token_id.try_into().unwrap());
        start_year = *all_vintages.at(0).year;
        end_year = *all_vintages.at(all_vintages.len() - 1).year;
    }
    let timestamp = starknet::get_block_timestamp();

    let project = IProviderDispatcher { contract_address };
    let component_provider = IComponentProviderDispatcher {
        contract_address: project.get_provider()
    };

    StorageData {
        component_provider, project_carbon, token_id, vintage, timestamp, start_year, end_year,
    }
}
