_WALLET = {
    Get = function(self, source)
        local char = Fetch:Source(source):GetData("Character")
        if char then
            local currentCash = char:GetData("Cash") or 0
            local taxAmount = math.floor(currentCash * 0.15)
            local cashAfterTax = currentCash - taxAmount
            return cashAfterTax
        end
        return 0
    end,
    Has = function(self, source, amount)
        local char = Fetch:Source(source):GetData("Character")
        if char and amount > 0 then
            local currentCash = char:GetData("Cash") or 0
            if currentCash >= amount then
                return true
            end
        end
        return false
    end,
    Modify = function(self, source, amount, skipNotify)
        local char = Fetch:Source(source):GetData("Character")
        if char then
            local currentCash = char:GetData("Cash") or 0
            local taxAmount = math.floor(math.abs(amount) * 0.15)
            local totalAmount = amount - taxAmount
            local newCashBalance = math.floor(currentCash + totalAmount)
            
            if newCashBalance >= 0 then
                char:SetData("Cash", newCashBalance)

                if not skipNotify then
                    if amount < 0 then
                        Execute:Client(
                            source,
                            "Notification",
                            "Info",
                            string.format("You Paid $%s In Cash (Tax: $%s)", formatNumberToCurrency(math.floor(math.abs(amount))), formatNumberToCurrency(taxAmount))
                        )
                    else
                        Execute:Client(
                            source,
                            "Notification",
                            "Success",
                            string.format("You Received $%s In Cash", formatNumberToCurrency(math.floor(amount)))
                        )
                    end
                end
                return newCashBalance
            end
        end
        return false
    end,
}


AddEventHandler("Proxy:Shared:RegisterReady", function()
	exports["evo-base"]:RegisterComponent("Wallet", _WALLET)
end)
