use serde::Serde;
use debug::PrintTrait;
use array::{ArrayTrait, SpanTrait};
use result::ResultTrait;

use starknet::{
    contract_address_const, get_block_info, ContractAddress, Felt252TryIntoContractAddress, TryInto,
    Into, OptionTrait, class_hash::Felt252TryIntoClassHash
};
use starknet::testing::{set_caller_address, set_contract_address, set_block_timestamp};
use starknet::syscalls::deploy_syscall;

use test::test_utils::assert_eq;

use metadata::metadata::project::contract::ContractMetadata;
use metadata::components::component::carbonable_logo::CarbonableLogo;
use metadata::tests::mocks::project::ProjectMock;

use metadata::interfaces::contract_metadata::{
    IContractMetadataDispatcher, IContractMetadataDispatcherTrait,
    IContractMetadataLibraryDispatcher
};
use metadata::interfaces::component_provider::{
    IComponentProviderDispatcher, IComponentProviderDispatcherTrait
};
use metadata::interfaces::project::{IProjectDispatcher, IProjectDispatcherTrait};
use metadata::tests::utils;

fn setup() -> (IComponentProviderDispatcher, ContractAddress, ContractAddress) {
    let account: ContractAddress = contract_address_const::<1>();
    set_caller_address(account);

    let provider = utils::deploy_component_provider();
    let project_address = utils::deploy_project_mock();

    provider.register('carbonable_logo', CarbonableLogo::TEST_CLASS_HASH.try_into().unwrap());
    let project = IProjectDispatcher { contract_address: project_address };
    project.set_component_provider(provider.contract_address);

    (provider, project_address, account)
}

#[test]
#[available_gas(3400000)]
fn test_construct_contract_uri() {
    let gas_start = utils::start_gas_meter();

    let (components, project_address, account) = setup();
    let token_id = 1_u256;
    let mut args: Array<felt252> = Default::default();
    token_id.serialize(ref args);

    let metadata = IContractMetadataLibraryDispatcher {
        class_hash: ContractMetadata::TEST_CLASS_HASH.try_into().unwrap()
    };

    set_contract_address(project_address);
    let uri: Array<felt252> = metadata.construct_contract_uri();
    let mut uri_span = uri.span();
    //uri.print();
    assert_eq(uri_span.pop_back().unwrap(), @'}', 'Failed to fetch contract uri');

    utils::stop_gas_meter(gas_start);
}
