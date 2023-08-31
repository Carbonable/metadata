use starknet::ContractAddress;
use metadata::metadata::common::models::StorageData;
use metadata::interfaces::erc3525::{IERC3525Dispatcher, IERC3525DispatcherTrait};
use metadata::interfaces::project::{IProjectDispatcher, IProjectDispatcherTrait};

#[inline(always)]
fn fetch_data(contract_address: ContractAddress, token_id: u256) -> StorageData {
    let erc3525 = IERC3525Dispatcher { contract_address };
    let project = IProjectDispatcher { contract_address };
    let slot = erc3525.slotOf(token_id);
    let total_value = erc3525.totalValue(slot);
    let asset_value = erc3525.valueOf(token_id);
    let project_value = project.getProjectValue(slot);
    // TODO: fetch total absorption till now

    StorageData { asset_value, total_value, project_value, slot }
}
