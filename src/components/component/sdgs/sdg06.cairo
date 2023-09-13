const NAME: felt252 = 'SDG06.svg';
#[starknet::contract]
mod Component {
    use array::ArrayTrait;
    use metadata::interfaces::component::IComponent;
    use metadata::components::configs::svg;

    #[storage]
    struct Storage {}

    #[external(v0)]
    impl ComponentImpl of IComponent<ContractState> {
        fn name(self: @ContractState) -> felt252 {
            super::NAME
        }

        fn render(self: @ContractState, args: Option<Span<felt252>>) -> Array<felt252> {
            let props: svg::Properties = svg::parse_properties(args);

            let mut data: Array<felt252> = Default::default();
            svg::add_header_helper(props, ref data);

            data.append(' id=\\"SDG6\\" xmlns=\\"http://w');
            data.append('ww.w3.org/2000/svg\\" viewBox=');
            data.append('\\"0 0 61.31 61.31\\"><rect fil');
            data.append('l=\\"#00add8\\" width=\\"61.31');
            data.append('\\" height=\\"61.31\\"/><g fill');
            data.append('=\\"#fff\\"><path d=\\"M42,24.7');
            data.append('6a.28.28,0,0,0-.2-.08H19.45a.28');
            data.append('.28,0,0,0-.2.08.29.29,0,0,0-.06');
            data.append('.21L23,47.68a.27.27,0,0,0,.26.2');
            data.append('2h4.6l.32,3.7H26.19l4.51,4.51,4');
            data.append('.52-4.52H33.29l.31-3.69h4.69a.2');
            data.append('5.25,0,0,0,.25-.22L42.06,25A.27');
            data.append('.27,0,0,0,42,24.76ZM33.36,42.94');
            data.append('a3.58,3.58,0,0,1-2.66.93A3.59,3');
            data.append('.59,0,0,1,28,42.94a4,4,0,0,1-.5');
            data.append('-4.83c.36-.67,2.93-4.53,3.15-4.');
            data.append('86v0h0v0c.22.33,2.8,4.19,3.16,4');
            data.append('.86A4,4,0,0,1,33.36,42.94Zm7.09');
            data.append('-13.4a2.75,2.75,0,0,0-2.11.13c-');
            data.append('2.77,1.12-4.66,1.53-7.58.61-1.8');
            data.append('3-.57-3.55-1.78-5.58-1a11.69,11');
            data.append('.69,0,0,1-4.13.93l-.88-4.51H41.');
            data.append('08Z\\"/><path d=\\"M9.18,17.6c2');
            data.append('.21,0,3.08-1.21,3.08-3.13V12.64');
            data.append('c0-2-.81-3.06-2.31-3.06a1.77,1.');
            data.append('77,0,0,0-1.72,1h0V7.91c0-.75.24');
            data.append('-1.28,1-1.28s1,.44,1,1.21v.82h1');
            data.append('.9V8c0-1.83-.6-3.11-2.91-3.11s-');
            data.append('3,1.41-3,3.35v6c0,1.92.84,3.31,');
            data.append('3,3.31m-1-5.22c0-.69.33-1.13,1-');
            data.append('1.13s1,.44,1,1.24v2.16c0,.79-.3');
            data.append(',1.25-1,1.25s-1-.48-1-1.25Z\\"/');
            data.append('><path d=\\"M17.73,9V6.5c0-.81.');
            data.append('38-1.4,1.3-1.4s1.23.54,1.23,1.3');
            data.append('V7h-.79V6.33c0-.32-.11-.5-.42-.');
            data.append('5s-.45.22-.45.54V9.15c0,.32.13.');
            data.append('54.45.54s.42-.2.42-.51V8.23h.79');
            data.append('v.89c0,.74-.3,1.3-1.23,1.3S17.7');
            data.append('3,9.82,17.73,9Z\\"/><path d=\\"');
            data.append('M20.74,5.16h.87V9.64h1v.71H20.7');
            data.append('4Z\\"/><path d=\\"M23.05,5.16h2');
            data.append('.08v.71H23.92V7.36h.87v.7h-.87V');
            data.append('9.64h1.21v.71H23.05Z\\"/><path');
            data.append(' d=\\"M25.46,10.35l1-5.19h1l1,5');
            data.append('.19h-.89l-.16-.95h-.93l-.15.95Z');
            data.append('m1.1-1.64h.69l-.34-2.08h0Z\\"/>');
            data.append('<path d=\\"M29.52,7.09v3.26h-.7');
            data.append('4V5.16h.86l.94,3v-3h.73v5.19h-.');
            data.append('76Z\\"/><path d=\\"M35,7.15l-.4');
            data.append('9,3.2h-.82L33,5.16h.84l.41,3.3h');
            data.append('0l.44-3.3h.71l.48,3.3h0l.4-3.3H');
            data.append('37l-.68,5.19h-.83L35,7.15Z\\"/>');
            data.append('<path d=\\"M37,10.35l1-5.19h1l1');
            data.append(',5.19H39l-.16-.95h-.92l-.16.95Z');
            data.append('m1.09-1.64h.7L38.4,6.63h0Z\\"/>');
            data.append('<path d=\\"M39.8,5.16h2.31v.71H');
            data.append('41.4v4.48h-.88V5.87H39.8Z\\"/><');
            data.append('path d=\\"M42.52,5.16H44.6v.71H');
            data.append('43.39V7.36h.87v.7h-.87V9.64H44.');
            data.append('6v.71H42.52Z\\"/><path d=\\"M45');
            data.append('.94,8v2.38h-.87V5.16h1.27c.88,0');
            data.append(',1.2.44,1.2,1.17V7c0,.56-.2.89-');
            data.append('.69,1l.83,2.35h-.92Zm0-2.1V7.49');
            data.append('h.29a.38.38,0,0,0,.43-.43V6.3a.');
            data.append('37.37,0,0,0-.43-.43Z\\"/><path');
            data.append(' d=\\"M17.59,17.63l1-5.2h1l1,5.');
            data.append('2h-.89l-.16-.95h-.93l-.15.95ZM1');
            data.append('8.69,16h.69L19,13.9h0Z\\"/><pat');
            data.append('h d=\\"M21.65,14.36v3.27h-.74v-');
            data.append('5.2h.86l.94,3v-3h.73v5.2h-.76Z');
            data.append('\\"/><path d=\\"M26.55,13.83v2.');
            data.append('4c0,.8-.33,1.4-1.26,1.4H23.94v-');
            data.append('5.2h1.35C26.22,12.43,26.55,13,2');
            data.append('6.55,13.83Zm-1.37,3.08a.45.45,0');
            data.append(',0,0,.5-.52V13.67a.45.45,0,0,0-');
            data.append('.5-.52h-.37v3.76Z\\"/><path d=');
            data.append('\\"M28.31,16.51v-.7h.81v.71c0,.');
            data.append('29.13.46.43.46s.4-.18.4-.46v-.2');
            data.append('a.93.93,0,0,0-.39-.73l-.51-.51a');
            data.append('1.75,1.75,0,0,1-.73-1.39v-.18a1');
            data.append('.09,1.09,0,0,1,1.23-1.14c.87,0,');
            data.append('1.21.43,1.21,1.18V14H30v-.45c0-');
            data.append('.3-.14-.44-.42-.44a.38.38,0,0,0');
            data.append('-.41.43v.1c0,.29.16.46.41.71l.5');
            data.append('6.55a1.73,1.73,0,0,1,.71,1.35v.');
            data.append('25a1.13,1.13,0,0,1-1.27,1.22A1.');
            data.append('09,1.09,0,0,1,28.31,16.51Z\\"/>');
            data.append('<path d=\\"M31.06,17.63l1-5.2h1');
            data.append('l1,5.2h-.89L33,16.68H32l-.15.95');
            data.append('ZM32.16,16h.69l-.34-2.08h0Z\\"/');
            data.append('><path d=\\"M35.12,14.36v3.27h-');
            data.append('.74v-5.2h.86l.94,3v-3h.73v5.2h-');
            data.append('.77Z\\"/><path d=\\"M37.41,12.4');
            data.append('3h.87v5.2h-.87Z\\"/><path d=\\"');
            data.append('M38.68,12.43H41v.72h-.71v4.48H3');
            data.append('9.4V13.15h-.72Z\\"/><path d=\\"');
            data.append('M40.89,17.63l1-5.2h1l1,5.2H43l-');
            data.append('.16-.95h-.93l-.15.95ZM42,16h.7l');
            data.append('-.34-2.08h0Z\\"/><path d=\\"M43');
            data.append('.73,12.43h2.32v.72h-.72v4.48h-.');
            data.append('88V13.15h-.72Z\\"/><path d=\\"M');
            data.append('46.45,12.43h.88v5.2h-.88Z\\"/><');
            data.append('path d=\\"M47.83,16.29V13.77a1.');
            data.append('32,1.32,0,1,1,2.64,0v2.52a1.32,');
            data.append('1.32,0,1,1-2.64,0Zm1.77.13V13.6');
            data.append('4c0-.32-.14-.54-.45-.54s-.45.22');
            data.append('-.45.54v2.78c0,.32.14.54.45.54S');
            data.append('49.6,16.74,49.6,16.42Z\\"/><pat');
            data.append('h d=\\"M51.71,14.36v3.27H51v-5.');
            data.append('2h.86l.94,3v-3h.73v5.2h-.77Z\\"');
            data.append('/></g></svg>');

            data
        }
    }
}

#[cfg(test)]
mod test {
    use array::{ArrayTrait, SpanTrait};
    use debug::PrintTrait;
    use traits::Into;

    use test::test_utils::assert_eq;

    use super::Component;
    use metadata::components::configs::svg;

    #[test]
    #[available_gas(15_000)]
    fn test_component_name() {
        let data: Span<felt252> = Component::__external::name(Default::default().span());
        let name: felt252 = *data[0];
        assert_eq(@name, @super::NAME, 'Couldn\'t get name');
    }

    #[test]
    #[available_gas(791000)]
    fn test_component_get() {
        let mut calldata: Array<felt252> = Default::default();
        let props: svg::Properties = Default::default();
        let mut props_se: Array<felt252> = Default::default();
        props.serialize(ref props_se);
        let args_props: Option<Span<felt252>> = Option::Some(props_se.span());
        args_props.serialize(ref calldata);
        let data: Span<felt252> = Component::__external::render(calldata.span());
        // data.len().print();
        assert_eq(@data.len(), @113_u32, 'Couldn\'t get data');
        let mut arr: Array<felt252> = ArrayTrait::new();
    }
}
