use array::{ArrayTrait, SpanTrait};
use alexandria_ascii::interger::ToAsciiTrait;

trait ToSpanOption {
    fn to_span(self: felt252) -> Option<Span<felt252>>;
}

impl ToSpanOptionImpl of ToSpanOption {
    #[inline(always)]
    fn to_span(self: felt252) -> Option<Span<felt252>> {
        Option::Some(array![self].span())
    }
}

fn to_ascii<T, impl TDrop: Drop<T>, impl TToAsciiTrait: ToAsciiTrait<T, Array<felt252>>>(
    x: T
) -> Span<felt252> {
    let res: Array<felt252> = x.to_ascii();
    res.span()
}
// #[inline(always)]
// fn to_ascii(x: u128) -> Span<felt252> {
//     let res: Array<felt252> = x.to_ascii();
//     res.span()
// }

trait ArrayConcat<T> {
    fn concat(ref self: Array<T>, data: Span<T>);
}

impl ArrayConcatTrait<T, impl TCopy: Copy<T>, impl TDrop: Drop<T>> of ArrayConcat<T> {
    fn concat(ref self: Array<T>, data: Span<T>) {
        let mut data = data;
        loop {
            match data.pop_front() {
                Option::Some(v) => {
                    self.append(*v);
                },
                Option::None(_) => {
                    break ();
                },
            };
        };
    }
}
