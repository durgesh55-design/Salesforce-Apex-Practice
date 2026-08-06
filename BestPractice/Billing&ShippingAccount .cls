public class AccountTriggerHandler {
    
// This method copies the Billing City to the Shipping City for new Accounts if the Shipping City is blank.

    public static void copyBillingCityToShippingCity(List<Account> newAccounts) {

        for (Account acc : newAccounts) {

            if (String.isBlank(acc.ShippingCity) &&
                !String.isBlank(acc.BillingCity)) {

                acc.ShippingCity = acc.BillingCity;
            }
        }
    }
}