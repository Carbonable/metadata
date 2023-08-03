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

use metadata::metadata::slots::banegasfarm::contract::{BanegasFarmUri};
use metadata::tests::mocks::project::ProjectMock;
use metadata::interfaces::slot_metadata::{ISlotMetadataDispatcher, ISlotMetadataDispatcherTrait};
use metadata::tests::utils::print_felt_span;

fn setup() -> (ContractAddress, ContractAddress) {
    let account: ContractAddress = contract_address_const::<1>();
    set_caller_address(account);

    let (address0, _) = deploy_syscall(
        ProjectMock::TEST_CLASS_HASH.try_into().unwrap(), 0, Default::default().span(), false
    )
        .unwrap();

    (address0, account)
}

#[test]
#[available_gas(400000)]
fn test_construct_token_uri() {
    let (project_address, account) = setup();
    //set_caller_address(project_address);
    let token_id = 1_u256;
    let mut args: Array<felt252> = Default::default();
    token_id.serialize(ref args);

    set_contract_address(project_address);
    let uri: Span<felt252> = BanegasFarmUri::__external::construct_token_uri(args.span());
    assert_eq(@uri.len(), @1_u32, 'Failed to fetch token uri')
}

#[test]
#[available_gas(300000)]
fn test_construct_slot_uri() {
    let (project_address, account) = setup();
    //set_caller_address(project_address);
    let token_id = 1_u256;
    let mut args: Array<felt252> = Default::default();
    token_id.serialize(ref args);

    set_contract_address(project_address);
    let uri: Span<felt252> = BanegasFarmUri::__external::construct_slot_uri(args.span());
    assert_eq(@uri.len(), @4_u32, 'Failed to fetch slot uri')
// print_felt_span(uri);
}
