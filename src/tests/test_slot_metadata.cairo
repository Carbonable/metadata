use serde::Serde;
use debug::PrintTrait;
use array::{ArrayTrait, SpanTrait};
use result::ResultTrait;

use starknet::{contract_address_const, ContractAddress, TryInto, OptionTrait};
use starknet::testing::{set_caller_address, set_contract_address};
use starknet::syscalls::deploy_syscall;

use test::test_utils::assert_eq;

use metadata::metadata::slots::banegasfarm::contract::BanegasFarmUri;
use metadata::tests::mocks::project::ProjectMock;
use metadata::interfaces::slot_metadata::{
    ISlotMetadataLibraryDispatcher, ISlotMetadataDispatcherTrait
};
use metadata::interfaces::component_provider::{
    IComponentProviderDispatcher, IComponentProviderDispatcherTrait
};
use metadata::interfaces::project::{IProjectDispatcher, IProjectDispatcherTrait};

use metadata::components::component::logos::carbonable::Component as CarbonableLogo;
use metadata::components::component::logos::ers::Component as ERSLogo;
use metadata::components::component::sdgs::sdg13::Component as SDG13;
use metadata::components::component::sdgs::sdg14::Component as SDG14;
use metadata::components::component::sdgs::sdg15::Component as SDG15;
use metadata::components::component::jpegs::farmer::Component as FarmerBackground;
use metadata::components::provider::ComponentProvider;


use metadata::tests::utils;

fn setup2() -> (ContractAddress, ContractAddress) {
    let account: ContractAddress = contract_address_const::<1>();
    set_caller_address(account);

    let (address0, _) = deploy_syscall(
        ProjectMock::TEST_CLASS_HASH.try_into().unwrap(), 0, Default::default().span(), false
    )
        .unwrap();

    (address0, account)
}

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
    provider.register('Farmer.jpeg.b64', FarmerBackground::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('ERS.svg', ERSLogo::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('SDG13.svg', SDG13::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('SDG14.svg', SDG14::TEST_CLASS_HASH.try_into().unwrap());
    provider.register('SDG15.svg', SDG15::TEST_CLASS_HASH.try_into().unwrap());

    let project = IProjectDispatcher { contract_address: project_address };
    project.set_component_provider(provider.contract_address);

    (provider, project_address, account)
}

#[test]
#[available_gas(1_100_000)]
fn test_construct_slot_uri() {
    let gas_start = utils::tests::start_gas_meter();

    let (_, project_address, _) = setup();
    let slot = 1_u256;

    let metadata = ISlotMetadataLibraryDispatcher {
        class_hash: BanegasFarmUri::TEST_CLASS_HASH.try_into().unwrap()
    };

    set_contract_address(project_address);
    let uri: Span<felt252> = metadata.construct_slot_uri(slot);
    let mut uri_span = uri;

    // utils::tests::print_felt_span(uri_span);

    assert_eq(uri_span.pop_back().unwrap(), @'example.com/', 'Failed to fetch slot uri');

    utils::tests::stop_gas_meter(gas_start);
}


#[test]
#[available_gas(55_000_000)]
fn test_construct_token_uri() {
    let gas_start = utils::tests::start_gas_meter();

    let (_, project_address, _) = setup();
    let token_id = 1_u256;

    let metadata = ISlotMetadataLibraryDispatcher {
        class_hash: BanegasFarmUri::TEST_CLASS_HASH.try_into().unwrap()
    };

    set_contract_address(project_address);

    let uri: Span<felt252> = metadata.construct_token_uri(token_id);
    let mut uri_span = uri;

    // utils::tests::print_felt_span(uri_span);

    let first = uri_span.pop_front().unwrap();
    assert_eq(first, @'data:application/json,', 'Failed to fetch token uri');

    utils::tests::stop_gas_meter(gas_start);
}
