use starknet::get_contract_address;
use starknet::ContractAddress;
use array::ArrayTrait;
use metadata::interfaces::erc3525::{IERC3525Dispatcher, IERC3525DispatcherTrait};
use metadata::interfaces::project::{IProjectDispatcher, IProjectDispatcherTrait};

use metadata::metadata::common::models::{StorageData, TokenData, SlotData, ProjectStatus};

mod Project {
    use metadata::metadata::common::models::{ProjectData, String};
    use array::ArrayTrait;
    use alexandria_ascii::ToAsciiTrait;

    const NAME: felt252 = 'Banegas Farm';
    const DEVELOPER: felt252 = 'Corcovado Foundation';
    const CERTIFIER: felt252 = 'ERS';
    const AREA: u256 = 25;
    const COUNTRY: felt252 = 'Costa Rica';
    const END_YEAR: u256 = 2052; // get from project
    const END_MONTH: u256 = 12; // get from project
    const DURATION_IN_YEARS: u256 = 30; // get from project
    const PROJECTED_CU: u256 = 1573; // get from project
    const COLOR: felt252 = 'Green';
    const TYPE: felt252 = 'ARR';
    const CATEGORY: felt252 = 'Regeneration';
    const STATUS: felt252 = 'Active'; // get from project
    const SOURCE: felt252 = 'Carbonable';

    #[inline(always)]
    fn get_sdgs() -> Span<felt252> {
        array![13, 14, 15].span()
    }

    #[inline(always)]
    fn get() -> ProjectData {
        ProjectData {
            name: array![NAME].span(),
            developer: array![DEVELOPER].span(),
            certifier: array![CERTIFIER].span(),
            area: AREA,
            country: array![COUNTRY].span(),
            end_year: END_YEAR,
            end_month: END_MONTH,
            duration_in_years: DURATION_IN_YEARS,
            projected_cu: PROJECTED_CU,
            color: array![COLOR].span(),
            type_: array![TYPE].span(),
            category: array![CATEGORY].span(),
            status: array![STATUS].span(),
            source: array![SOURCE].span(),
            sdgs: get_sdgs(),
        }
    }
}

mod Description {
    use array::ArrayTrait;

    #[inline(always)]
    fn get() -> Array<felt252> {
        let mut data = Default::default();
        add(ref data);
        data
    }

    #[inline(always)]
    fn add(ref data: Array<felt252>) {
        data.append('TODO: Add description');
    }
}

#[inline(always)]
fn fetch_slot_data(contract_address: ContractAddress, slot: u256) -> felt252 {
    'todo'
}

#[inline(always)]
fn fetch_token_data(contract_address: ContractAddress, token_id: u256) -> TokenData {
    // Local ProjectData
    // External ProjectData (Starknet) in template?
    // TODO

    let project_data = Project::get();

    let instance = IERC3525Dispatcher { contract_address };
    let project_instance = IProjectDispatcher { contract_address };
    let slot = instance.slotOf(token_id);
    let slot_data = SlotData {
        project_data,
        total_value: instance.totalValue(slot),
        project_value: project_instance.getProjectValue(slot),
        slot,
        status: ProjectStatus::Live,
        description: Description::get().span()
    };

    TokenData {
        slot_data, asset_value: instance.valueOf(token_id), description: Description::get().span()
    }
}
