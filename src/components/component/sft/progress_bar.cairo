const NAME: felt252 = 'SFT.ProgressBar.svg';

use metadata::metadata::common::models::Shortstring;

// TODO: generalize
#[derive(Serde, Drop, Default, Copy)]
enum Stroke {
    #[default]
    Color: felt252,
    Gradient: Span<(felt252, felt252)>
}
// TODO: Generalize component
// add width, height, ...
#[derive(Serde, Drop, Copy)]
struct Properties {
    x: Option<usize>,
    y: Option<usize>,
    progress: u8,
    stroke_outer: Stroke,
    stroke_outer_opacity: Option<Shortstring>,
    outer_opacity: Option<Shortstring>,
    stroke_inner: Stroke,
    stroke_inner_opacity: Option<Shortstring>,
    inner_opacity: Option<Shortstring>,
}

impl DefaultProperties of Default<Properties> {
    fn default() -> Properties {
        Properties {
            x: Option::None,
            y: Option::None,
            progress: 69,
            stroke_outer: Stroke::Color('#f69a86'),
            stroke_outer_opacity: Option::Some('0.2'),
            outer_opacity: Option::Some('0.2'),
            stroke_inner: Stroke::Color('#b44040'),
            stroke_inner_opacity: Option::None,
            inner_opacity: Option::None,
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
    use metadata::components::configs::svg;
    use super::{Properties, Stroke};


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
            let svg_props = svg::Properties {
                width: Option::None, height: Option::None, x: props.x, y: props.y,
            };
            svg::add_header_helper(svg_props, ref data);

            data.append('><path stroke=\\"');

            let mut need_defs: bool = false;

            match props.stroke_outer {
                Stroke::Color(color) => {
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
            data.append('"8\\" d=\\"M4 26h106\\"');

            match props.outer_opacity {
                Option::Some(opacity) => {
                    data.append(' \\" opacity=\\"');
                    data.append(opacity);
                    data.append('\\"/>');
                },
                Option::None => {
                    data.append('/>');
                },
            }

            data.append('<path stroke=\\"');

            match props.stroke_inner {
                Stroke::Color(color) => {
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

            data.append((props.progress.into() * 103_u32 / 100 + 1).to_ascii());
            data.append('\\"');
            match props.inner_opacity {
                Option::Some(opacity) => {
                    data.append(' opacity=\\"');
                    data.append(opacity);
                    data.append('\\"/>');
                },
                Option::None => {
                    data.append(' />');
                },
            }

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
                            match grad.pop_front() {
                                Option::Some((
                                    offset, color
                                )) => {
                                    data.append('<stop offset=\\"');
                                    data.append(*offset);
                                    data.append('\\" stop-color=\\"');
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
                        data.append('<linearGradient id=\\"b\\" x1=');
                        data.append('\\"');
                        data.append((props.progress + 1).to_ascii());
                        data.append('\\" x2=\\"4\\" y1=\\"27\\');
                        data.append('" y2=\\"27\\" gradientUnits=\\"');
                        data.append('userSpaceOnUse\\">');
                        let mut grad = grad;
                        loop {
                            match grad.pop_front() {
                                Option::Some((
                                    offset, color
                                )) => {
                                    data.append('<stop offset=\\"');
                                    data.append(*offset);
                                    data.append('\\" stop-color=\\"');
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
    #[available_gas(600_000)]
    fn test_component_get() {
        let mut calldata: Array<felt252> = Default::default();
        let props: Properties = Default::default();
        let mut props_se: Array<felt252> = Default::default();
        props.serialize(ref props_se);
        let args_props: Option<Span<felt252>> = Option::Some(props_se.span());
        args_props.serialize(ref calldata);
        let data: Span<felt252> = Component::__external::render(calldata.span());

        // utils::tests::print_felt_span(data);

        assert_eq(@data.len(), @0x15_u32, 'Couldn\'t get data');
        let mut arr: Array<felt252> = ArrayTrait::new();
    }
}
