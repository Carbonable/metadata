use debug::PrintTrait;

use starknet::{contract_address_const, ContractAddress};
use starknet::testing::{set_caller_address, set_contract_address};
use starknet::syscalls::deploy_syscall;

use test::test_utils::assert_eq;

use metadata::metadata::slots::banegas_farm::contract::BanegasFarmUri;
use metadata::metadata::slots::las_delicias::contract::LasDeliciasUri;
use metadata::metadata::slots::manjarisoa::contract::ManjarisoaUri;
use metadata::tests::mocks::project::ProjectMock;
use metadata::interfaces::slot_descriptor::{
    ISlotDescriptorLibraryDispatcher, ISlotDescriptorDispatcherTrait
};
use metadata::interfaces::component_provider::{
    IComponentProviderDispatcher, IComponentProviderDispatcherTrait
};
use metadata::interfaces::project::{IProjectDispatcher, IProjectDispatcherTrait};

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
use metadata::components::component::sft::border::Component as SFTBorder;
use metadata::components::component::sft::badges::badge_Infty::Component as SFTBadgeInfty;
use metadata::components::component::sft::badges::badge_XL::Component as SFTBadgeXL;
use metadata::components::component::sft::badges::badge_L::Component as SFTBadgeL;
use metadata::components::component::sft::badges::badge_M::Component as SFTBadgeM;
use metadata::components::component::sft::badges::badge_S::Component as SFTBadgeS;
use metadata::components::component::sft::badges::badge_XS::Component as SFTBadgeXS;
use metadata::components::component::jpegs::farmer::Component as FarmerBackground;
use metadata::components::component::jpegs::parrot::Component as ParrotBackground;
use metadata::components::component::jpegs::swamp::Component as SwampBackground;
use metadata::components::component::jpegs::monkey::Component as MonkeyBackground;
use metadata::components::provider::ComponentProvider;

use metadata::tests::utils;

fn setup() -> (IComponentProviderDispatcher, ContractAddress, ContractAddress) {
    let account: ContractAddress = contract_address_const::<1>();
    set_caller_address(account);

    let provider = IComponentProviderDispatcher {
        contract_address: utils::contracts::deploy(
            ComponentProvider::TEST_CLASS_HASH, ArrayTrait::new()
        )
    };
    let project_address = utils::contracts::deploy(ProjectMock::TEST_CLASS_HASH, ArrayTrait::new());

    provider.register('carbonable_logo', CarbonableLogo::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('Farmer.jpg.b64', FarmerBackground::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('Swamp.jpg.b64', SwampBackground::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('Parrot.jpg.b64', ParrotBackground::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('Monkey.jpg.b64', MonkeyBackground::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('ERS.svg', ERSLogo::TEST_CLASS_HASH.try_into().unwrap());

    provider.register('SDG01.svg', SDG01::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('SDG02.svg', SDG02::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('SDG03.svg', SDG03::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('SDG04.svg', SDG04::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('SDG05.svg', SDG05::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('SDG06.svg', SDG06::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('SDG07.svg', SDG07::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('SDG08.svg', SDG08::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('SDG09.svg', SDG09::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('SDG10.svg', SDG10::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('SDG11.svg', SDG11::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('SDG12.svg', SDG12::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('SDG13.svg', SDG13::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('SDG14.svg', SDG14::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('SDG15.svg', SDG15::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('SDG16.svg', SDG16::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('SDG17.svg', SDG17::TEST_CLASS_HASH.try_into().unwrap());

    provider.register('SFT.ProgressBar.svg', SFTProgressBar::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('SFT.Status.svg', SFTStatus::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('SFT.Border.svg', SFTBorder::TEST_CLASS_HASH.try_into().unwrap());

    provider.register('SFT.BadgeInfty.svg', SFTBadgeInfty::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('SFT.BadgeXL.svg', SFTBadgeXL::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('SFT.BadgeL.svg', SFTBadgeL::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('SFT.BadgeM.svg', SFTBadgeM::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('SFT.BadgeS.svg', SFTBadgeS::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('SFT.BadgeXS.svg', SFTBadgeXS::TEST_CLASS_HASH.try_into().unwrap());

    let project = IProjectDispatcher { contract_address: project_address };
    project.set_component_provider(provider.contract_address);

    (provider, project_address, account)
}

#[test]
#[available_gas(10_000_000)]
fn test__setup() {
    let (_, project_address, _) = setup();
}

#[test]
#[available_gas(15_000_000)]
fn test_construct_slot_uri() {
    let (_, project_address, _) = setup();
    let slot = 1_u256;

    let metadata = ISlotDescriptorLibraryDispatcher {
        class_hash: BanegasFarmUri::TEST_CLASS_HASH.try_into().unwrap()
    };

    set_contract_address(project_address);
    let uri: Span<felt252> = metadata.construct_slot_uri(slot);
    let mut uri_span = uri;

    // utils::tests::print_felt_span(uri_span);

    assert_eq(uri_span.pop_back().unwrap(), @'example.com/', 'Failed to fetch slot uri');
}

#[test]
#[available_gas(250_000_000)]
fn test_construct_token_uri() {
    let (_, project_address, _) = setup();
    let token_id = 1_u256;

    let metadata = ISlotDescriptorLibraryDispatcher {
        class_hash: BanegasFarmUri::TEST_CLASS_HASH.try_into().unwrap()
    };

    set_contract_address(project_address);

    let uri: Span<felt252> = metadata.construct_token_uri(token_id);
    let mut uri_span = uri;

    utils::tests::print_felt_span(uri_span);

    let first = uri_span.pop_front().unwrap();
    assert_eq(first, @'data:application/json,', 'Failed to fetch token uri');
}
