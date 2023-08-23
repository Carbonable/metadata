const NAME: felt252 = 'SDG01.svg';
#[starknet::contract]
mod Component {
    use array::ArrayTrait;
    use metadata::interfaces::component::IComponent;

    #[storage]
    struct Storage {}

    #[external(v0)]
    impl ComponentImpl of IComponent<ContractState> {
        fn name(self: @ContractState) -> felt252 {
            super::NAME
        }

        fn concat(self: @ContractState, mut data: Array<felt252>) -> Array<felt252> {
            data.append('<svg id=\\"SDG1\\" xmlns=\\"htt');
            data.append('p://www.w3.org/2000/svg\\" view');
            data.append('Box=\\"0 0 62 62\\"> <rect fill');
            data.append('=\\"#ea1d2d\\" width=\\"62\\" h');
            data.append('eight=\\"62\\" /> <path fill=\\');
            data.append('"#fff\\" d=\\"M5.46,7.83c-.11.0');
            data.append('6-.42.18-.94.37s-.68.23-.79.28V');
            data.append('6.78A10.81,10.81,0,0,0,5,6.19a3');
            data.append('.93,3.93,0,0,0,1-.73H7.75v12H5.');
            data.append('46Z\\" /> <path fill=\\"#fff\\"');
            data.append(' d=\\"M12.78,5.45h.58l1.11,2.61');
            data.append('V5.45h.69V10h-.55L13.49,7.3V10h');
            data.append('-.71Z\\" /> <path fill=\\"#fff');
            data.append('\\" d=\\"M16,9.71a1.75,1.75,0,0');
            data.append(',1-.3-1.11V6.88a1.7,1.7,0,0,1,.');
            data.append('3-1.1,1.26,1.26,0,0,1,1-.38,1.2');
            data.append('3,1.23,0,0,1,1,.38,1.64,1.64,0,');
            data.append('0,1,.31,1.1V8.6A1.73,1.73,0,0,1');
            data.append(',18,9.71a1.2,1.2,0,0,1-1,.38A1.');
            data.append('23,1.23,0,0,1,16,9.71Zm1.4-.41a');
            data.append('1.11,1.11,0,0,0,.09-.51V6.69a1.');
            data.append('14,1.14,0,0,0-.09-.51.5.5,0,0,0');
            data.append('-.76,0,1.09,1.09,0,0,0-.09.5v2.');
            data.append('1a1.11,1.11,0,0,0,.09.51.49.49,');
            data.append('0,0,0,.76,0Z\\" /> <path fill=');
            data.append('\\"#fff\\" d=\\"M12.78,12.93h1.');
            data.append('34c.78,0,1.17.44,1.17,1.3a1.1,1');
            data.append('.1,0,0,1-1.23,1.25h-.45v2h-.83Z');
            data.append('m1.15,2a.58.58,0,0,0,.46-.15.79');
            data.append('.79,0,0,0,.12-.51,2.12,2.12,0,0');
            data.append(',0,0-.42.37.37,0,0,0-.17-.22.71');
            data.append('.71,0,0,0-.37-.07h-.32v1.37Z\\"');
            data.append(' /> <path fill=\\"#fff\\" d=\\"');
            data.append('M16,17.19a1.69,1.69,0,0,1-.31-1');
            data.append('.11V14.36A1.69,1.69,0,0,1,16,13');
            data.append('.25a1.26,1.26,0,0,1,1-.37,1.27,');
            data.append('1.27,0,0,1,1,.37,1.75,1.75,0,0,');
            data.append('1,.3,1.11v1.72A1.73,1.73,0,0,1,');
            data.append('18,17.19a1.19,1.19,0,0,1-1,.38A');
            data.append('1.21,1.21,0,0,1,16,17.19Zm1.39-');
            data.append('.41a1.11,1.11,0,0,0,.09-.51V14.');
            data.append('16a1.09,1.09,0,0,0-.09-.5.39.39');
            data.append(',0,0,0-.37-.17.4.4,0,0,0-.38.17');
            data.append(',1,1,0,0,0-.1.5v2.11a1,1,0,0,0,');
            data.append('.1.51.48.48,0,0,0,.75,0Z\\" /> ');
            data.append('<path fill=\\"#fff\\" d=\\"M18.');
            data.append('67,12.93h.73l.6,3.24.58-3.24h.7');
            data.append('5l-.92,4.58h-.82Z\\" /> <path f');
            data.append('ill=\\"#fff\\" d=\\"M21.77,12.9');
            data.append('3h1.92v.59H22.6v1.32h.86v.58H22');
            data.append('.6v1.52h1.1v.57H21.77Z\\" /> <p');
            data.append('ath fill=\\"#fff\\" d=\\"M24.16');
            data.append(',12.93h1.1a1.72,1.72,0,0,1,1.08');
            data.append('.28,1.1,1.1,0,0,1,.36.94,1.64,1');
            data.append('.64,0,0,1-.13.71.79.79,0,0,1-.4');
            data.append('4.4l.64,2.25h-.84l-.54-2.1H25v2');
            data.append('.1h-.83Zm1.1,2a.65.65,0,0,0,.5-');
            data.append('.16.79.79,0,0,0,.15-.54.81.81,0');
            data.append(',0,0-.13-.52.59.59,0,0,0-.48-.1');
            data.append('7H25v1.39Z\\" /> <path fill=\\"');
            data.append('#fff\\" d=\\"M27.75,13.55H27v-.');
            data.append('62h2.34v.62h-.75v4h-.83Z\\" /> ');
            data.append('<path fill=\\"#fff\\" d=\\"M30.');
            data.append('31,15.76l-.93-2.83h.78l.57,1.82');
            data.append('.53-1.82H32l-.91,2.83v1.75h-.8Z');
            data.append('\\" /> <path fill=\\"#fff\\" d=');
            data.append('\\"M48.36,30a1.75,1.75,0,1,1,1.');
            data.append('75,1.74A1.75,1.75,0,0,1,48.36,3');
            data.append('0\\" /> <path fill=\\"#fff\\" d');
            data.append('=\\"M52.15,32.38a2.32,2.32,0,0,');
            data.append('1,2.11,2.32v4.84a.68.68,0,0,1-1');
            data.append('.35,0V35.38c0-.16,0-.37-.33-.37');
            data.append('s-.24.21-.25.34V47.82a1,1,0,0,1');
            data.append('-1.95,0V40.64a.26.26,0,0,0-.27-');
            data.append('.29h0a.28.28,0,0,0-.29.29v7.18a');
            data.append('1,1,0,0,1-1.94,0V35.35c0-.13-.0');
            data.append('5-.34-.24-.34s-.33.21-.33.37v4.');
            data.append('16a.68.68,0,0,1-1.36,0V34.7a2.3');
            data.append('2,2.32,0,0,1,2.12-2.32h4.08\\" ');
            data.append('/> <path fill=\\"#fff\\" d=\\"M');
            data.append('38,30.87a1.65,1.65,0,1,0-1.65,1');
            data.append('.66A1.65,1.65,0,0,0,38,30.87\\"');
            data.append(' /> <path fill=\\"#fff\\" d=\\"');
            data.append('M33,34.62,31.61,39.1s-.24.82.45');
            data.append(',1,.91-.6.91-.6l1.11-3.73s.06-.');
            data.append('29.27-.23.14.37.14.37l-1.93,7h1');
            data.append('.79v5a.86.86,0,0,0,1.72,0v-5h.4');
            data.append('9v5a.87.87,0,0,0,1.73,0v-5h1.79');
            data.append('l-1.93-7s-.08-.3.14-.37.27.23.2');
            data.append('7.23l1.11,3.73s.21.81.91.6.45-1');
            data.append(',.45-1l-1.38-4.48s-.49-1.29-1.5');
            data.append('8-1.29h-3.5c-1.09,0-1.58,1.29-1');
            data.append('.58,1.29\\" /> <path fill=\\"#f');
            data.append('ff\\" d=\\"M28.07,30.87a1.66,1.');
            data.append('66,0,1,0-1.66,1.66,1.65,1.65,0,');
            data.append('0,0,1.66-1.66\\" /> <path fill=');
            data.append('\\"#fff\\" d=\\"M23.08,34.62,21');
            data.append('.71,39.1s-.25.82.45,1,.9-.6.9-.');
            data.append('6l1.11-3.73s.06-.29.27-.23.14.3');
            data.append('7.14.37l-1.93,7h1.79v5a.87.87,0');
            data.append(',0,0,1.73,0v-5h.49v5a.86.86,0,0');
            data.append(',0,1.72,0v-5h1.8l-1.93-7s-.08-.');
            data.append('3.13-.37.28.23.28.23l1.11,3.73s');
            data.append('.21.81.9.6.45-1,.45-1l-1.38-4.4');
            data.append('8s-.49-1.29-1.57-1.29H24.66c-1.');
            data.append('09,0-1.58,1.29-1.58,1.29\\" /> ');
            data.append('<path fill=\\"#fff\\" d=\\"M43.');
            data.append('53,40.13a1.38,1.38,0,1,0-1.38-1');
            data.append('.38,1.37,1.37,0,0,0,1.38,1.38\\');
            data.append('" /> <path fill=\\"#fff\\" d=\\');
            data.append('"M40.23,44.41a.47.47,0,0,0,.2.6');
            data.append('5.46.46,0,0,0,.59-.19l.75-2.39s');
            data.append('.13-.16.13,0V48.1h0a.71.71,0,1,');
            data.append('0,1.41,0V45.89s0-.32.21-.32.22.');
            data.append('32.22.32V48.1a.7.7,0,0,0,.7.71.');
            data.append('71.71,0,0,0,.71-.71V42.48c0-.16');
            data.append('.09,0,.09,0l.59,1.63a3.73,3.73,');
            data.append('0,0,0,.33.76.51.51,0,0,0,.68-.2');
            data.append('8.52.52,0,0,0-.05-.5h0s-.88-2.1');
            data.append('6-1-2.45c-.31-.91-.87-.9-1.42-.');
            data.append('92s-.87,0-.87,0-.34,0-1.06,0-1,');
            data.append('.39-1.74,2.43c-.11.29-.49,1.24-');
            data.append('.5,1.3Z\\" /> <path fill=\\"#ff');
            data.append('f\\" d=\\"M13.3,30a1.75,1.75,0,');
            data.append('1,0-1.75,1.74A1.75,1.75,0,0,0,1');
            data.append('3.3,30\\" /> <path fill=\\"#fff');
            data.append('\\" d=\\"M9.51,32.38A2.32,2.32,');
            data.append('0,0,0,7.39,34.7v4.84a.68.68,0,0');
            data.append(',0,1.36,0V35.38c0-.16,0-.37.33-');
            data.append('.37s.24.21.25.34V47.82a1,1,0,1,');
            data.append('0,1.94,0V40.64a.27.27,0,0,1,.28');
            data.append('-.29h0a.27.27,0,0,1,.28.29v7.18');
            data.append('a1,1,0,1,0,1.94,0V35.35c0-.13.0');
            data.append('5-.34.25-.34s.33.21.33.37v4.16a');
            data.append('.68.68,0,0,0,1.35,0V34.7a2.32,2');
            data.append('.32,0,0,0-2.11-2.32H9.51\\" /> ');
            data.append('<path fill=\\"#fff\\" d=\\"M6.4');
            data.append('3,48.83H6.37a.37.37,0,0,1-.3-.4');
            data.append('4l1.55-8.22a.36.36,0,0,1,.43-.2');
            data.append('9.36.36,0,0,1,.3.43L6.8,48.53A.');
            data.append('37.37,0,0,1,6.43,48.83Z\\" /> <');
            data.append('path fill=\\"#fff\\" d=\\"M16.5');
            data.append('3,39.41a.5.5,0,0,0-.92.26.9.9,0');
            data.append(',0,0,.05.22L17,42.41a.83.83,0,0');
            data.append(',1,.09.33v5.39h0a.68.68,0,0,0,1');
            data.append('.36,0V46s0-.3.2-.3.21.3.21.3v2.');
            data.append('13a.68.68,0,1,0,1.35,0V42.74a.8');
            data.append('3.83,0,0,1,.09-.33l1.28-2.32a2.');
            data.append('33,2.33,0,0,0,.16-.42.5.5,0,0,0');
            data.append('-.93-.26h0s-.69,1.17-.9,1.39a.5');
            data.append('7.57,0,0,1-.42.2H17.86a.6.6,0,0');
            data.append(',1-.43-.2c-.21-.22-.85-1.36-.89');
            data.append('-1.39Z\\" /> <path fill=\\"#fff');
            data.append('\\" d=\\"M18.69,40.13a1.38,1.38');
            data.append(',0,1,0-1.38-1.38,1.38,1.38,0,0,');
            data.append('0,1.38,1.38\\" /> <polygon fill');
            data.append('=\\"#fff\\" points=\\"18.69 42.');
            data.append('06 20.25 43.2 20.99 45.92 18.69');
            data.append(' 45.92 16.4 45.92 17.14 43.2 18');
            data.append('.69 42.06\\" /></svg>');

            data
        }

        fn get(self: @ContractState) -> Array<felt252> {
            let mut test = ArrayTrait::<felt252>::new();
            self.concat(test)
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

    #[test]
    #[available_gas(20000)]
    fn test_component_name() {
        let data: Span<felt252> = Component::__external::name(Default::default().span());
        let name: felt252 = *data[0];
        assert_eq(@name, @super::NAME, 'Couldn\'t get name');
    }

    #[test]
    #[available_gas(1000000)]
    fn test_component_get() {
        let data: Span<felt252> = Component::__external::get(Default::default().span());
        assert_eq(@data.len(), @0xa1_u32, 'Couldn\'t get data');
        let mut arr: Array<felt252> = ArrayTrait::new();
    }
}
