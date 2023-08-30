const NAME: felt252 = 'ProgressBar.svg';

// TODO: generalize all this

#[derive(Serde, Drop, Copy)]
struct LinearGradient {
    // id: usize,
    // x1: usize,
    // x2: usize,
    // y1: usize,
    // y2: usize,
    // gradient_units: usize,
    stops: Span<(felt252, felt252)>, // (offset, color)
}

#[derive(Serde, Drop, Default, Copy)]
enum Stroke {
    #[default]
    Color: felt252,
    Gradient: LinearGradient
}

#[derive(Serde, Drop, Copy)]
struct Properties {
    progress: usize,
    x: Option<usize>,
    y: Option<usize>,
    stroke_outer: Stroke,
    stroke_inner: Stroke,
}

impl DefaultProperties of Default<Properties> {
    fn default() -> Properties {
        Properties {
            progress: 69,
            x: Option::None,
            y: Option::None,
            stroke_outer: Stroke::Color('f69a86'),
            stroke_inner: Stroke::Color('b44040'),
        }
    }
}

#[starknet::contract]
mod Component {
    use array::ArrayTrait;
    use serde::Serde;
    use option::OptionTrait;

    use alexandria_ascii::ToAsciiTrait;

    use metadata::interfaces::component::IComponent;
    use super::{Properties, Stroke, LinearGradient};


    #[storage]
    struct Storage {}

    #[external(v0)]
    impl ComponentImpl of IComponent<ContractState> {
        fn name(self: @ContractState) -> felt252 {
            super::NAME
        }

        fn render(self: @ContractState, args: Option<Span<felt252>>) -> Array<felt252> {
            let props: Properties = self.parse_properties(args);
            assert(props.progress <= 100, '0 <= progress <= 100');

            let mut data: Array<felt252> = Default::default();

            data.append('<svg xmlns=\\"http://www.w3.org');
            data.append('/2000/svg\\" fill=\\"none\\" vi');
            data.append('ewBox=\\"0 0 114 31\\"');

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

            data.append('><path stroke=\\"');

            let mut need_defs: bool = false;

            match props.stroke_outer {
                Stroke::Color(color) => {
                    data.append('#');
                    data.append(color);
                },
                Stroke::Gradient(gradient) => {
                    data.append('url(#a)');
                    need_defs = true;
                },
            }

            data.append('\\" stro');
            data.append('ke-linecap=\\"round\\" stroke-o');
            data.append('pacity=\\".3\\" stroke-width=\\');
            data.append('"8\\" d=\\"M4 26h106\\"/>');

            data.append('<path stroke=\\"');

            match props.stroke_inner {
                Stroke::Color(color) => {
                    data.append('#');
                    data.append(color);
                },
                Stroke::Gradient(gradient) => {
                    data.append('url(#b)');
                    need_defs = true;
                },
            }

            data.append('\\" stro');
            data.append('ke-linecap=\\"round\\" stroke-o');
            data.append('pacity=\\".8\\" stroke-width=\\');
            data.append('"4\\" d=\\"M5 26h');

            data.append((props.progress * 103 / 100 + 1).to_ascii());

            data.append('\\" opacity');
            data.append('=\\".5\\"/>');

            if need_defs {
                data.append('<defs>');

                match props.stroke_outer {
                    Stroke::Color(color) => (),
                    Stroke::Gradient(grad) => {
                        data.append('<linearGradient id=\\"a\\" x1=');
                        data.append('\\"110\\" x2=\\"4\\" y1=\\"27\\');
                        data.append('" y2=\\"27\\" gradientUnits=\\"');
                        data.append('userSpaceOnUse\\">');
                        let mut grad = grad;
                        loop {
                            match grad.stops.pop_front() {
                                Option::Some((
                                    offset, color
                                )) => {
                                    data.append('<stop offset=\\"');
                                    data.append(*offset);
                                    data.append('\\" stop-color=\\"#');
                                    data.append(*color);
                                    data.append('\\"/>');
                                },
                                Option::None => {
                                    break;
                                }
                            };
                        };
                        data.append('</linearGradient>');
                    },
                }

                match props.stroke_inner {
                    Stroke::Color(color) => (),
                    Stroke::Gradient(grad) => {
                        data.append('<linearGradient id=\\"a\\" x1=');
                        data.append('\\"');
                        data.append((props.progress + 1).to_ascii());
                        data.append('\\" x2=\\"4\\" y1=\\"27\\');
                        data.append('" y2=\\"27\\" gradientUnits=\\"');
                        data.append('userSpaceOnUse\\">');
                        let mut grad = grad;
                        loop {
                            match grad.stops.pop_front() {
                                Option::Some((
                                    offset, color
                                )) => {
                                    data.append('<stop offset=\\"');
                                    data.append(*offset);
                                    data.append('\\" stop-color=\\"#');
                                    data.append(*color);
                                    data.append('\\"/>');
                                },
                                Option::None => {
                                    break;
                                }
                            };
                        };
                        data.append('</linearGradient>');
                    },
                }
                data.append('</defs>');
            }
            data.append('</svg>');

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

        assert_eq(@data.len(), @0x16_u32, 'Couldn\'t get data');
        let mut arr: Array<felt252> = ArrayTrait::new();
    }
}
