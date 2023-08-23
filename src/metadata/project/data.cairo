use core::option::OptionTrait;
use core::traits::TryInto;

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

mod SVG {
    use array::ArrayTrait;

    use metadata::interfaces::component_provider::{
        IComponentProviderDispatcher, IComponentProviderDispatcherTrait
    };
    use metadata::interfaces::component::{IComponentLibraryDispatcher, IComponentDispatcherTrait};
    use metadata::interfaces::project::{IProjectDispatcher, IProjectDispatcherTrait};
    use metadata::metadata::common::data::get_provider;

    #[inline(always)]
    fn get_carbonable_logo() -> Span<felt252> {
        // TODO: contract_address in params
        let provider = get_provider(); // add contract address?
        let logo_component = provider.get('carbonable_logo');
        let mut logo = array!['data:image/svg+xml,'];
        logo_component.concat(logo).span()
    }
}

mod Starknet {
    use starknet::get_contract_address;
    use array::{ArrayTrait, SpanTrait};
    use metadata::interfaces::erc3525::{IERC3525Dispatcher, IERC3525DispatcherTrait};
    use core::Into;

    #[inline(always)]
    fn get_project_count() -> Span<felt252> {
        // TODO: contract_address in params
        let project = IERC3525Dispatcher { contract_address: get_contract_address() };
        let mut result: Array<felt252> = ArrayTrait::new();
        let count: u256 = project.slotCount();
        // TODO: to_ascii?
        result.append(count.high.into());
        result.append(count.low.into());
        result.span()
    }
}
