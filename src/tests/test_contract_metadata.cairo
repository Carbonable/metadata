mod metadata_test {
    use serde::Serde;
    use debug::PrintTrait;
    use array::{ArrayTrait, SpanTrait};
    use result::ResultTrait;

    use starknet::{
        contract_address_const, get_block_info, ContractAddress, Felt252TryIntoContractAddress,
        TryInto, Into, OptionTrait, class_hash::Felt252TryIntoClassHash
    };
    use starknet::testing::{set_caller_address, set_contract_address, set_block_timestamp};
    use starknet::syscalls::deploy_syscall;

    use test::test_utils::assert_eq;

    use metadata::metadata::project::contract::ContractMetadata;
    use metadata::tests::mocks::project::ProjectMock;
    use metadata::interfaces::contract_metadata::{
        IContractMetadataDispatcher, IContractMetadataDispatcherTrait,
        IContractMetadataLibraryDispatcher
    };
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
    #[available_gas(200000)]
    fn test_construct_contract_uri() {
        let (project_address, account) = setup();
        let token_id = 1_u256;
        let mut args: Array<felt252> = Default::default();
        token_id.serialize(ref args);

        let metadata = IContractMetadataLibraryDispatcher {
            class_hash: ContractMetadata::TEST_CLASS_HASH.try_into().unwrap()
        };

        set_contract_address(project_address);
        let uri: Array<felt252> = metadata.construct_contract_uri();
        assert_eq(@uri.len(), @13_u32, 'Failed to fetch contract uri');
    // print_felt_span(uri.span());
    }
}
