use debug::PrintTrait;

use starknet::{contract_address_const, ContractAddress};
use starknet::testing::{set_caller_address, set_contract_address, set_block_timestamp};
use starknet::syscalls::deploy_syscall;

use test::test_utils::assert_eq;

use metadata::metadata::vintages::banegas_farm::contract::BanegasCPV3Uri;
use metadata::tests::mocks::cpv3_project::CPV3ProjectMock;
use metadata::interfaces::slot_descriptor::{
    IUriDescriptorLibraryDispatcher, IUriDescriptorDispatcherTrait
};
use metadata::interfaces::component_provider::{
    IComponentProviderDispatcher, IComponentProviderDispatcherTrait
};
use metadata::interfaces::component_provider::{IProviderExtDispatcher, IProviderExtDispatcherTrait};

use metadata::components::component::logos::carbonable::Component as CarbonableLogo;
use metadata::components::component::logos::ers::Component as ERSLogo;
use metadata::components::component::sdgs::sdg01::Component as SDG01;
use metadata::components::component::sdgs::sdg02::Component as SDG02;
use metadata::components::component::sdgs::sdg03::Component as SDG03;
use metadata::components::component::sdgs::sdg04::Component as SDG04;
use metadata::components::component::sdgs::sdg05::Component as SDG05;
use metadata::components::component::sdgs::sdg06::Component as SDG06;
use metadata::components::component::sdgs::sdg07::Component as SDG07;
use metadata::components::component::sdgs::sdg08::Component as SDG08;
use metadata::components::component::sdgs::sdg09::Component as SDG09;
use metadata::components::component::sdgs::sdg10::Component as SDG10;
use metadata::components::component::sdgs::sdg11::Component as SDG11;
use metadata::components::component::sdgs::sdg12::Component as SDG12;
use metadata::components::component::sdgs::sdg13::Component as SDG13;
use metadata::components::component::sdgs::sdg14::Component as SDG14;
use metadata::components::component::sdgs::sdg15::Component as SDG15;
use metadata::components::component::sdgs::sdg16::Component as SDG16;
use metadata::components::component::sdgs::sdg17::Component as SDG17;
use metadata::components::component::sft::progress_bar::Component as SFTProgressBar;
use metadata::components::component::sft::status::Component as SFTStatus;
use metadata::components::component::sft::border_v2::Component as SFTBorder;
use metadata::components::component::sft::badges::badge_Infty::Component as SFTBadgeInfty;
use metadata::components::component::sft::badges::badge_XL::Component as SFTBadgeXL;
use metadata::components::component::sft::badges::badge_L::Component as SFTBadgeL;
use metadata::components::component::sft::badges::badge_M::Component as SFTBadgeM;
use metadata::components::component::sft::badges::badge_S::Component as SFTBadgeS;
use metadata::components::component::sft::badges::badge_XS::Component as SFTBadgeXS;
use metadata::components::component::backgrounds::bg_banegas_farm::Component as ParrotBackground;
use metadata::components::component::backgrounds::bg_las_delicias::Component as SwampBackground;
use metadata::components::component::backgrounds::bg_manjarisoa::Component as MonkeyBackground;
use metadata::components::component::backgrounds::bg_karathuru::Component as WaterBackground;
use metadata::components::provider::ComponentProvider;

use metadata::tests::utils;
use starknet::ClassHash;

fn as_class(class: felt252) -> ClassHash {
    class.try_into().unwrap()
}

fn setup() -> (IComponentProviderDispatcher, ContractAddress, ContractAddress) {
    let account: ContractAddress = contract_address_const::<1>();
    set_caller_address(account);

    let mut calldata: Array<felt252> = Default::default();
    let owner = utils::contracts::owner();
    owner.serialize(ref calldata);

    let provider = IComponentProviderDispatcher {
        contract_address: utils::contracts::deploy(ComponentProvider::TEST_CLASS_HASH, calldata)
    };
    let project_address = utils::contracts::deploy(CPV3ProjectMock::TEST_CLASS_HASH, array![]);

    set_contract_address(utils::contracts::owner());
    provider.register(as_class(CarbonableLogo::TEST_CLASS_HASH));
    provider.register(as_class(SwampBackground::TEST_CLASS_HASH));
    provider.register(as_class(ParrotBackground::TEST_CLASS_HASH));
    provider.register(as_class(MonkeyBackground::TEST_CLASS_HASH));
    provider.register(as_class(WaterBackground::TEST_CLASS_HASH));

    provider.register(as_class(SDG01::TEST_CLASS_HASH));
    provider.register(as_class(SDG02::TEST_CLASS_HASH));
    provider.register(as_class(SDG03::TEST_CLASS_HASH));
    provider.register(as_class(SDG04::TEST_CLASS_HASH));
    provider.register(as_class(SDG05::TEST_CLASS_HASH));
    provider.register(as_class(SDG06::TEST_CLASS_HASH));
    provider.register(as_class(SDG07::TEST_CLASS_HASH));
    provider.register(as_class(SDG08::TEST_CLASS_HASH));
    provider.register(as_class(SDG09::TEST_CLASS_HASH));
    provider.register(as_class(SDG10::TEST_CLASS_HASH));
    provider.register(as_class(SDG11::TEST_CLASS_HASH));
    provider.register(as_class(SDG12::TEST_CLASS_HASH));
    provider.register(as_class(SDG13::TEST_CLASS_HASH));
    provider.register(as_class(SDG14::TEST_CLASS_HASH));
    provider.register(as_class(SDG15::TEST_CLASS_HASH));
    provider.register(as_class(SDG16::TEST_CLASS_HASH));
    provider.register(as_class(SDG17::TEST_CLASS_HASH));

    provider.register(as_class(SFTProgressBar::TEST_CLASS_HASH));
    provider.register(as_class(SFTStatus::TEST_CLASS_HASH));
    provider.register(as_class(SFTBorder::TEST_CLASS_HASH));

    provider.register(as_class(SFTBadgeInfty::TEST_CLASS_HASH));
    provider.register(as_class(SFTBadgeXL::TEST_CLASS_HASH));
    provider.register(as_class(SFTBadgeL::TEST_CLASS_HASH));
    provider.register(as_class(SFTBadgeM::TEST_CLASS_HASH));
    provider.register(as_class(SFTBadgeS::TEST_CLASS_HASH));
    provider.register(as_class(SFTBadgeXS::TEST_CLASS_HASH));

    let project = IProviderExtDispatcher { contract_address: project_address };
    project.set_component_provider(provider.contract_address);

    (provider, project_address, account)
}

#[test]
#[available_gas(20_000_000)]
fn test__setup() {
    let (_, project_address, _) = setup();
}


#[test]
#[available_gas(250_000_000)]
fn test_construct_uri() {
    let (_, project_address, _) = setup();
    let token_id = 1_u256;

    let metadata = IUriDescriptorLibraryDispatcher {
        class_hash: as_class(BanegasCPV3Uri::TEST_CLASS_HASH)
    };

    set_contract_address(project_address);
    set_block_timestamp(1710425366);

    let uri: Span<felt252> = metadata.construct_uri(token_id);
    let mut uri_span = uri;

    utils::tests::print_felt_span(uri_span);

    let first = uri_span.pop_front().unwrap();
    assert_eq(first, @'data:application/json,', 'Failed to fetch token uri');
}
