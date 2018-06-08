package edu.mum.coffee.domain;

public enum ProductType {
	BREAKFAST("Breakfast"),LUNCH("Lunch"),DINNER("Dinner");
	
	private String productType;
    private ProductType(String s){
    	setProductType(s);
    }
	/**
	 * @return the productType
	 */
	public String getProductType() {
		return productType;
	}
	/**
	 * @param productType the productType to set
	 */
	public void setProductType(String productType) {
		this.productType = productType;
	}
}
