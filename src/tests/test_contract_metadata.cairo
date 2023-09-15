use starknet::{contract_address_const, ContractAddress};
use starknet::testing::{set_caller_address, set_contract_address, set_block_timestamp};
use starknet::syscalls::deploy_syscall;

use test::test_utils::assert_eq;

use metadata::metadata::project::contract::ContractMetadata;
use metadata::components::component::logos::carbonable::Component as CarbonableLogo;
use metadata::tests::mocks::project::ProjectMock;
use metadata::components::provider::ComponentProvider;

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

    let provider = IComponentProviderDispatcher {
        contract_address: utils::contracts::deploy(
            ComponentProvider::TEST_CLASS_HASH, ArrayTrait::new()
        )
    };
    let project_address = utils::contracts::deploy(ProjectMock::TEST_CLASS_HASH, ArrayTrait::new());

    provider.register('carbonable_logo', CarbonableLogo::TEST_CLASS_HASH.try_into().unwrap());
    let project = IProjectDispatcher { contract_address: project_address };
    project.set_component_provider(provider.contract_address);

    (provider, project_address, account)
}

#[test]
#[available_gas(4400000)]
fn test_construct_contract_uri() {
    let (components, project_address, account) = setup();

    let metadata = IContractMetadataLibraryDispatcher {
        class_hash: ContractMetadata::TEST_CLASS_HASH.try_into().unwrap()
    };

    set_contract_address(project_address);
    let uri: Span<felt252> = metadata.construct_contract_uri();
    let mut uri_span = uri;

    assert_eq(uri_span.pop_back().unwrap(), @'}', 'Failed to fetch contract uri');
}
