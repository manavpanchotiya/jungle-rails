describe('Jungle Product page', () => {
  it('should visit prodct detail page when a product is selected', () => {
    
    cy.visit('/');

    cy.get('.products article').should("be.visible");

    cy.get('.products article').first().click();
    
  });
});