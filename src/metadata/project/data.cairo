mod Description {
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
        data.append('ves with Carbonable. Utilizing');
        data.append(' cutting-edge technologies like');
        data.append(' blockchain, satellite imagery,');
        data.append('and AI, we redefine carbon inve');
        data.append('sting with unparalleled transpa');
        data.append('rency, traceability, and operat');
        data.append('ional efficiency. With Carbonab');
        data.append('le, elevate your investments wh');
        data.append('ile contributing positively to');
        data.append(' our planet.');
    }
}

mod SVG {
    use starknet::ContractAddress;
    use metadata::metadata::common::utils::ArrayConcat;
    use metadata::interfaces::component_provider::{
        IComponentProviderDispatcher, IComponentProviderDispatcherTrait
    };
    use metadata::interfaces::component::{IComponentLibraryDispatcher, IComponentDispatcherTrait};
    use metadata::metadata::common::data::get_provider;

    use debug::PrintTrait;

    #[inline(always)]
    fn get_carbonable_logo(instance: ContractAddress) -> Span<felt252> {
        let provider = get_provider(instance);
        let logo_component = provider.get('Carbonable.svg');
        let mut logo: Array<felt252> = array!['data:image/svg+xml,'];
        let image: Array<felt252> = logo_component.unwrap().render(Option::None);
        logo.concat(image.span());

        logo.span()
    }
}

mod Starknet {
    use starknet::{get_contract_address, ContractAddress};

    use cairo_erc_3525::interface::{IERC3525Dispatcher, IERC3525DispatcherTrait};
    use cairo_erc_3525::extensions::slotenumerable::interface::{
        IERC3525SlotEnumerableDispatcher, IERC3525SlotEnumerableDispatcherTrait
    };
    use alexandria_ascii::ToAsciiTrait;

    #[inline(always)]
    fn get_project_count(contract_address: ContractAddress) -> Span<felt252> {
        let project = IERC3525SlotEnumerableDispatcher { contract_address };
        let mut result: Array<felt252> = Default::default();
        let count: felt252 = project.slot_count().low.to_ascii();
        result.append(count);
        result.span()
    }
}
