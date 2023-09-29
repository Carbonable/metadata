// Starknet imports
use starknet::ContractAddress;

// External imports
use openzeppelin::introspection::interface::{ISRC5Dispatcher, ISRC5DispatcherTrait, ISRC5_ID};
use openzeppelin::token::erc721::interface::{IERC721_ID, IERC721_METADATA_ID};
use cairo_erc_3525::interface::IERC3525_ID;
use cairo_erc_3525::extensions::metadata::interface::IERC3525_METADATA_ID;
use cairo_erc_3525::extensions::slotenumerable::interface::IERC3525_SLOT_ENUMERABLE_ID;

#[inline(always)]
fn src5(contract_address: ContractAddress) {
    let src5 = ISRC5Dispatcher { contract_address };
    let is_SRC5 = src5.supports_interface(ISRC5_ID);
    assert(src5.supports_interface(ISRC5_ID), 'ISRC5 not supported');
}

#[inline(always)]
fn compatible(contract_address: ContractAddress) {
    let src5 = ISRC5Dispatcher { contract_address };
    src5(contract_address);
    assert(src5.supports_interface(IERC721_ID), 'IERC721 not supported');
    assert(src5.supports_interface(IERC721_METADATA_ID), 'IERC721Metadata not supported');
    assert(src5.supports_interface(IERC3525_ID), 'IERC3525 not supported');
    assert(src5.supports_interface(IERC3525_METADATA_ID), '3525Metadata not supported');
    assert(src5.supports_interface(IERC3525_SLOT_ENUMERABLE_ID), '3525SlotEnumerable unsupported');
}
