use array::{ArrayTrait, SpanTrait};
use debug::PrintTrait;
use starknet::syscalls::deploy_syscall;
use starknet::{
    ContractAddress, Felt252TryIntoContractAddress, TryInto, Into, OptionTrait,
    class_hash::Felt252TryIntoClassHash
};
use result::ResultTrait;

use metadata::interfaces::component_provider::{IComponentProviderDispatcher};
use metadata::components::provider::ComponentProvider;

use metadata::tests::mocks::project::ProjectMock;

fn deploy_project_mock() -> ContractAddress {
    let (address, _) = deploy_syscall(
        ProjectMock::TEST_CLASS_HASH.try_into().unwrap(), 0, Default::default().span(), false
    )
        .unwrap();

    address
}


fn deploy_component_provider() -> IComponentProviderDispatcher {
    let (address, _) = deploy_syscall(
        ComponentProvider::TEST_CLASS_HASH.try_into().unwrap(), 0, ArrayTrait::new().span(), false
    )
        .unwrap();

    return IComponentProviderDispatcher { contract_address: address };
}


fn print_felt_span(a: Span<felt252>) {
    let length = a.len();
    let mut index = 0;
    loop {
        if index < length {
            let value = *a.at(index);
            value.print();
        } else {
            break;
        }
        index += 1;
    };
}
