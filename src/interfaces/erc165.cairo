#[starknet::interface]
trait IERC165<T> {
    fn supportsInterface(self: @T, interface_id: u32) -> bool;
}
