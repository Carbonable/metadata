use core::option::OptionTrait;
use core::traits::TryInto;

mod DescriptionData {
    use array::ArrayTrait;

    #[inline(always)]
    fn description() -> Array<felt252> {
        let mut data = Default::default();
        add_description(ref data);
        data
    }

    #[inline(always)]
    fn add_description(ref data: Array<felt252>) {
        data.append('Unlock the simplest and most ef');
        data.append('ficient path to invest in leadi');
        data.append('ng nature regeneration initiati');
        data.append('ves with Carbonable. Utilizing ');
        data.append('cutting-edge technologies like ');
        data.append('blockchain, satellite imagery, ');
        data.append('and AI, we redefine carbon inve');
        data.append('sting with unparalleled transpa');
        data.append('rency, traceability, and operat');
        data.append('ional efficiency. With Carbonab');
        data.append('le, elevate your investments wh');
        data.append('ile contributing positively to ');
        data.append('our planet.');
    }
}

mod ContractSVG {
    use metadata::interfaces::component_provider::{
        IComponentProviderDispatcher, IComponentProviderDispatcherTrait
    };
    use metadata::interfaces::project::{IProjectDispatcher, IProjectDispatcherTrait};
    use starknet::{contract_address_const, get_contract_address};

    #[inline(always)]
    fn get_provider() -> IComponentProviderDispatcher {
        let project = IProjectDispatcher { contract_address: get_contract_address() };
        let provider = IComponentProviderDispatcher {
            contract_address: project.get_component_provider()
        };
        provider
    }

    #[inline(always)]
    fn get_carbonable_logo() -> Span<felt252> {
        let provider = get_provider();
        let logo = provider.get('carbonable_logo');
        logo
    }
}

mod Starknet {
    use starknet::get_contract_address;
    use array::{ArrayTrait, SpanTrait};
    use metadata::interfaces::erc3525::{IERC3525Dispatcher, IERC3525DispatcherTrait};
    use core::Into;

    #[inline(always)]
    fn get_project_count() -> Span<felt252> {
        let project = IERC3525Dispatcher { contract_address: get_contract_address() };
        let mut result: Array<felt252> = ArrayTrait::new();
        let count: u256 = project.slotCount();
        result.append(count.high.into());
        result.append(count.low.into());
        result.span()
    }
}
