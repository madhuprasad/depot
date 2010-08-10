<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0090)http://media.pragprog.com/titles/rails3/code/depot_q/app/views/info/who_bought.xml.builder -->
<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<META content="MSHTML 6.00.2900.2180" name=GENERATOR></HEAD>
<BODY><PRE>
xml.order_list(:for_product => @product.title) do
  for o in @orders
    xml.order do
      xml.name(o.name)
      xml.email(o.email)
    end
  end
end
</PRE></BODY></HTML>
