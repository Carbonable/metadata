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

    const NAME: u256 = 'Banegas Farm';
    const DEVELOPER: u256 = 'Corcovado Foundation';
    const CERTIFIER: u256 = 'Wildsense';
    const AREA: u256 = 25;
    const COUNTRY: u256 = 'Costa Rica';
    const END_YEAR: u256 = 2052; // mutable storage?
    const END_MONTH: u256 = 12; // mutable storage?
    const DURATION_IN_YEARS: u256 = 30; // 2052 - 2022; consteval_int!(END_YEAR - 2022);
    const PROJECTED_CU: u256 = 1573;
    const COLOR: u256 = 'Green';
    const TYPE: u256 = 'Forest';
    const CATEGORY: u256 = 'Regeneration';
    const STATUS: u256 = 'Active'; // mutable storage?
    const SOURCE: u256 = 'Carbonable';

    #[inline(always)]
    fn get_sdgs() -> Span<felt252> {
        array![13, 14, 15].span()
    }

    #[inline(always)]
    fn get() -> ProjectData {
        ProjectData {
            name: NAME.to_ascii().span(),
            developer: DEVELOPER.to_ascii().span(),
            certifier: CERTIFIER.to_ascii().span(),
            area: AREA,
            country: COUNTRY.to_ascii().span(),
            end_year: END_YEAR,
            end_month: END_MONTH,
            duration_in_years: DURATION_IN_YEARS,
            projected_cu: PROJECTED_CU,
            color: COLOR.to_ascii().span(),
            type_: TYPE.to_ascii().span(),
            category: CATEGORY.to_ascii().span(),
            status: STATUS.to_ascii().span(),
            source: SOURCE.to_ascii().span(),
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

    let project_data = Project::get();

    let instance = IERC3525Dispatcher { contract_address };
    let project_instance = IProjectDispatcher { contract_address };
    let slot = instance.slotOf(token_id);
    let slot_data = SlotData {
        project_data,
        total_value: instance.totalValue(slot),
        project_value: project_instance.getProjectValue(slot),
        slot,
        status: ProjectStatus::Active,
        description: Description::get().span()
    };

    TokenData {
        slot_data, asset_value: instance.valueOf(token_id), description: Description::get().span()
    }
}
