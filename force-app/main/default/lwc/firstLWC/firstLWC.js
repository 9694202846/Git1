import { LightningElement } from 'lwc';


export default class FirstLWC extends LightningElement {

    get myVal() {
        return '**Hello!**';
    }
    handleClick() {
        alert('successful');
    }
}