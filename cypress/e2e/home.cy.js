describe('Jungle Home Page', () => {
  it('should visit the home page', () => {
    cy.visit('/');

    cy.get(".products article").should("have.length",2);
    
  });
});