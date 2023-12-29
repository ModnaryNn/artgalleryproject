/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package art.Galleries;

import art.DAO.ConnectionProvider;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import java.sql.*;
import javax.swing.table.TableModel;

public class ManageItem extends javax.swing.JFrame {
    private int selectedID = 0;
    private int galleryID = 1;
    private int exhibitionID = 1;

    /**
     * Creates new form ManageAccount
     */
    public ManageItem() {
        initComponents();
        setLocationRelativeTo(null);
    }
    
    public ManageItem(int galleryID, int exhibitionID ) {
        initComponents();
        setLocationRelativeTo(null);
        this.galleryID = galleryID;
        this.exhibitionID = exhibitionID;
    }
    

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane2 = new javax.swing.JScrollPane();
        jTextArea1 = new javax.swing.JTextArea();
        jCheckBox1 = new javax.swing.JCheckBox();
        jLabel1 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        itemTable = new javax.swing.JTable();
        closeButton = new javax.swing.JButton();
        jScrollPane3 = new javax.swing.JScrollPane();
        artworkTable = new javax.swing.JTable();
        addBTN = new javax.swing.JButton();
        removeBTN = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();

        jTextArea1.setColumns(20);
        jTextArea1.setRows(5);
        jScrollPane2.setViewportView(jTextArea1);

        jCheckBox1.setText("jCheckBox1");

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setUndecorated(true);
        addComponentListener(new java.awt.event.ComponentAdapter() {
            public void componentShown(java.awt.event.ComponentEvent evt) {
                formComponentShown(evt);
            }
        });

        jLabel1.setFont(new java.awt.Font("Impact", 0, 24)); // NOI18N
        jLabel1.setText("Exhibition Manage");

        itemTable.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "ID", "TITLE"
            }
        ));
        itemTable.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                itemTableMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(itemTable);
        if (itemTable.getColumnModel().getColumnCount() > 0) {
            itemTable.getColumnModel().getColumn(1).setHeaderValue("Start date");
        }

        closeButton.setText("BACK");
        closeButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                closeButtonActionPerformed(evt);
            }
        });

        artworkTable.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "ID", "TITLE"
            }
        ));
        artworkTable.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                artworkTableMouseClicked(evt);
            }
        });
        jScrollPane3.setViewportView(artworkTable);

        addBTN.setText("ADD");
        addBTN.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                addBTNActionPerformed(evt);
            }
        });

        removeBTN.setText("REMOVE");
        removeBTN.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                removeBTNActionPerformed(evt);
            }
        });

        jLabel2.setText("Exhibition artworks");

        jLabel3.setText("Available artworks");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(closeButton, javax.swing.GroupLayout.PREFERRED_SIZE, 73, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 344, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addComponent(jLabel2, javax.swing.GroupLayout.DEFAULT_SIZE, 302, Short.MAX_VALUE)
                            .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE))
                        .addGap(45, 45, 45)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(removeBTN, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(addBTN, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 46, Short.MAX_VALUE)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 302, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 186, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 15, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(12, 12, 12)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 476, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(layout.createSequentialGroup()
                                .addGap(125, 125, 125)
                                .addComponent(addBTN)
                                .addGap(18, 18, 18)
                                .addComponent(removeBTN)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(closeButton))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 476, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void formComponentShown(java.awt.event.ComponentEvent evt) {//GEN-FIRST:event_formComponentShown
        // TODO add your handling code here:
        DefaultTableModel model = (DefaultTableModel) itemTable.getModel();
        try{
            Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM ( items INNER JOIN artworks on artworks.id =items.artwork_id) WHERE items.exhibition_id = '"+exhibitionID+"'");
            while (rs.next()){
                model.addRow(new Object[]{rs.getString("artworks.id"),rs.getString("title")});
            }
        }
        catch (Exception e){
            JOptionPane.showMessageDialog(null, e);    
        }
        
        
        DefaultTableModel model2 = (DefaultTableModel) artworkTable.getModel();
        try{
            Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM artworks WHERE gallery_id = '"+galleryID +"' AND artworks.id NOT IN(SELECT artwork_id FROM items WHERE exhibition_id = '"+exhibitionID+"');");
            while (rs.next()){
                model2.addRow(new Object[]{rs.getString("ID"),rs.getString("title")});
            }
        }
        catch (Exception e){
            JOptionPane.showMessageDialog(null, e);    
        }
    }//GEN-LAST:event_formComponentShown

    private void closeButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_closeButtonActionPerformed
        // TODO add your handling code here:
        setVisible(false); //you can't see me!
        dispose(); //Destroy the JFrame object
    }//GEN-LAST:event_closeButtonActionPerformed

    private void itemTableMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_itemTableMouseClicked
        int index = itemTable.getSelectedRow();
        TableModel model = itemTable.getModel();
        
        String id = model.getValueAt(index,0).toString();
        selectedID = Integer.parseInt(id);
        System.out.println(selectedID);
        
        addBTN.setEnabled(false);
        removeBTN.setEnabled(true);
    }//GEN-LAST:event_itemTableMouseClicked

    private void artworkTableMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_artworkTableMouseClicked
        int index = artworkTable.getSelectedRow();
        TableModel model = artworkTable.getModel();
        
        String id = model.getValueAt(index,0).toString();
        selectedID = Integer.parseInt(id);
        System.out.println(selectedID);
        addBTN.setEnabled(true);
        removeBTN.setEnabled(false);
    }//GEN-LAST:event_artworkTableMouseClicked

    private void addBTNActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_addBTNActionPerformed
        try{
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("INSERT INTO items(exhibition_id, artwork_id) VALUE (?, ?)");
            ps.setInt(1,exhibitionID);
            ps.setInt(2,selectedID);
            ps.executeUpdate();
            JOptionPane.showMessageDialog(null,"Added Sucessfully");
            setVisible(false);
            dispose(); 
            new ManageItem().setVisible(true);
            }
            catch (Exception e){
                JOptionPane.showMessageDialog(null,e);
        }
    }//GEN-LAST:event_addBTNActionPerformed

    private void removeBTNActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_removeBTNActionPerformed
        try{
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("DELETE FROM items WHERE exhibition_id = ? AND artwork_id = ?;");
            ps.setInt(1,exhibitionID);
            ps.setInt(2,selectedID);
            ps.executeUpdate();
            JOptionPane.showMessageDialog(null,"Remove Sucessfully");
            setVisible(false);
            dispose(); 
            new ManageItem().setVisible(true);
            }
            catch (Exception e){
                JOptionPane.showMessageDialog(null,e);
        }
    }//GEN-LAST:event_removeBTNActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(ManageItem.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ManageItem.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ManageItem.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ManageItem.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new ManageItem().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton addBTN;
    private javax.swing.JTable artworkTable;
    private javax.swing.JButton closeButton;
    private javax.swing.JTable itemTable;
    private javax.swing.JCheckBox jCheckBox1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JTextArea jTextArea1;
    private javax.swing.JButton removeBTN;
    // End of variables declaration//GEN-END:variables
}
