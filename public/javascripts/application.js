function clickSection(section) 
{ 
    if(section == 'all')
    {
      window.location.href="/obory"; 
    }else if(section == 'graduation')
    {
      window.location.href="/obory/s-maturitou";
    }else{
      window.location.href="/obory/bez-maturity";
    }
}
