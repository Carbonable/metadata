const NAME: felt252 = 'SFT.Status.svg';

use metadata::metadata::common::models::{Shortstring, String};

#[derive(Serde, Drop, Copy)]
struct Properties {
    x: Option<usize>,
    y: Option<usize>,
    status: String,
    r1_width: usize,
    c_fill: Shortstring,
    c_opacity: Shortstring,
    t_fill: Shortstring,
    r2_stroke: Shortstring,
    r2_stroke_opacity: Shortstring,
}

impl DefaultProperties of Default<Properties> {
    fn default() -> Properties {
        Properties {
            x: Option::None,
            y: Option::None,
            status: array!['Upcoming'].span(),
            r1_width: 85,
            c_fill: '#8CA5FF',
            c_opacity: '.9',
            t_fill: '#97ACFA',
            r2_stroke: '#8994F5',
            r2_stroke_opacity: '.3',
        }
    }
}

#[starknet::contract]
mod Component {
    use alexandria_ascii::ToAsciiTrait;

    use metadata::metadata::common::utils::ArrayConcat;
    use metadata::interfaces::component::IComponent;
    use super::Properties;


    #[storage]
    struct Storage {}

    #[external(v0)]
    impl ComponentImpl of IComponent<ContractState> {
        fn name(self: @ContractState) -> felt252 {
            super::NAME
        }

        fn render(self: @ContractState, args: Option<Span<felt252>>) -> Array<felt252> {
            let props: Properties = self.parse_properties(args);

            let mut data: Array<felt252> = Default::default();
            data.append('<svg');
            match props.x {
                Option::Some(x) => {
                    data.append(' x=\\"');
                    data.append(x.to_ascii());
                    data.append('\\"');
                },
                Option::None => (),
            }
            match props.y {
                Option::Some(y) => {
                    data.append(' y=\\"');
                    data.append(y.to_ascii());
                    data.append('\\"');
                },
                Option::None => (),
            }

            data.append(' fill=\\"none\\"><rect widt');
            data.append('h=\\"');
            data.append(props.r1_width.to_ascii());
            data.append('\\" height=\\"22\\" fill');
            data.append('=\\"#1F2128\\" fill-opacity=\\"');
            data.append('.2\\" rx=\\"11\\"/><circle cx=');
            data.append('\\"10\\" cy=\\"11\\" r=\\"3\\"');
            data.append(' fill=\\"');
            data.append(props.c_fill);
            data.append('\\" opacity=\\"');
            data.append(props.c_opacity);
            data.append('\\"/><text fill=\\"');
            data.append(props.t_fill);
            data.append('\\"');
            data.append(' font-family=\\"Inter\\" font-s');
            data.append('ize=\\"12\\" font-weight=\\"500');
            data.append('\\" letter-spacing=\\"0em\\"><t');
            data.append('span x=\\"18.14\\" y=\\"15\\">');
            data.concat(props.status);
            data.append('</tspan></text><rect wid');
            data.append('th=\\"');
            data.append((props.r1_width - 1).to_ascii());
            data.append('\\" height=\\"21\\" x=');
            data.append('\\".5\\" y=\\".5\\" stroke=\\"');
            data.append(props.r2_stroke);
            data.append('\\" stroke-opacity=\\"');
            data.append(props.r2_stroke_opacity);
            data.append('\\" rx=\\"10.5\\"/></svg>');
            data
        }
    }

    #[generate_trait]
    impl HelperImpl of HelperTrait {
        fn parse_properties(self: @ContractState, args: Option<Span<felt252>>) -> Properties {
            let props: Properties = match args {
                Option::Some(props) => {
                    let mut props = props;
                    Serde::<Properties>::deserialize(ref props)
                        .expect('Couldn\'t deserialize properties')
                },
                Option::None => Default::default(),
            };
            props
        }
    }
}

#[cfg(test)]
mod test {
    use array::{ArrayTrait, SpanTrait};
    use debug::PrintTrait;
    use traits::Into;

    use test::test_utils::assert_eq;

    use super::{Component, Properties};

    use metadata::tests::utils;

    #[test]
    #[available_gas(15_000)]
    fn test_component_name() {
        let data: Span<felt252> = Component::__external::name(Default::default().span());
        let name: felt252 = *data[0];
        assert_eq(@name, @super::NAME, 'Couldn\'t get name');
    }

    #[test]
    #[available_gas(520_000)]
    fn test_component_get() {
        let mut calldata: Array<felt252> = Default::default();
        let props: Properties = Default::default();
        let mut props_se: Array<felt252> = Default::default();
        props.serialize(ref props_se);
        let args_props: Option<Span<felt252>> = Option::Some(props_se.span());
        args_props.serialize(ref calldata);
        let data: Span<felt252> = Component::__external::render(calldata.span());

        // utils::tests::print_felt_span(data);

        assert_eq(@data.len(), @0x1e_u32, 'Couldn\'t get data');
        let mut arr: Array<felt252> = ArrayTrait::new();
    }
}
